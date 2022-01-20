import 'package:cuidapet_mobile/app/core/exceptions/failure.dart';
import 'package:cuidapet_mobile/app/core/exceptions/social_login_canceled.dart';
import 'package:cuidapet_mobile/app/core/exceptions/user_exists_exception.dart';
import 'package:cuidapet_mobile/app/core/helpers/constants.dart';
import 'package:cuidapet_mobile/app/core/helpers/logger.dart';
import 'package:cuidapet_mobile/app/core/local_storages/local_security_storage.dart';
import 'package:cuidapet_mobile/app/core/local_storages/local_storage.dart';
import 'package:cuidapet_mobile/app/models/social_network_model.dart';
import 'package:cuidapet_mobile/app/models/social_type.dart';
import 'package:cuidapet_mobile/app/repositories/social/social_repository.dart';
import 'package:cuidapet_mobile/app/repositories/user/user_repository.dart';
import 'package:cuidapet_mobile/app/services/user/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserServiceImpl implements UserService {
  UserServiceImpl({
    required UserRepository userRepository,
    required Logger log,
    required LocalStorage localStorage,
    required LocalSecurityStorage localSecurityStorage,
    required SocialRepository socialRepository,
  }) : 
    _userRepository = userRepository,
    _log = log,
    _localStorage = localStorage,
    _localSecurityStorage = localSecurityStorage,
    _socialRepository = socialRepository;

  final UserRepository _userRepository;
  final Logger _log;
  final LocalStorage _localStorage;
  final LocalSecurityStorage _localSecurityStorage;
  final SocialRepository _socialRepository;

  @override
  Future<void> register(String email, String password) async {
    try {
      await _userRepository.register(email, password);
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      await login(email, password);
    } on FirebaseAuthException catch (e, s) {
      _log.error('Erro ao criar usuário no FirebaseAuth', e, s);

      throw Failure(message: 'Erro ao criar usuário no FirebaseAuth');
    }
  }

  @override
  Future<void> login(String login, String password) async {
    try {
      final accessToken = await _userRepository.login(login, password);
      _log.info('accessToken = $accessToken');
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: login, password: password);

      await _saveAccessToken(accessToken);
      await _confirmLogin();
      await _getUserData();

      _log.info('Login realizado com sucesso');
    } on FirebaseAuthException catch (e, s) {
      _log.error('Erro ao fazer login no Firebase Auth', e, s);
      throw Failure(message: 'Erro ao fazer login no Firebase');
    }
  }

  Future<void> _getUserData() async {
    final userLogged = await _userRepository.getUserLogged();

    await _localStorage.write(Constants.USER_DATA_KEY, userLogged.toJson());
  }

  Future<void> _saveAccessToken(String accessToken) => 
    _localStorage.write<String>(Constants.ACCESS_TOKEN_KEY, accessToken);
  
  Future<void> _confirmLogin() async {
    final confirmModel = await _userRepository.confirmLogin();

    await _saveAccessToken(confirmModel.accessToken);
    await _localSecurityStorage.write(Constants.REFRESH_TOKEN_KEY, confirmModel.refreshToken);
  }

  @override
  Future<void> socialLogin(SocialType socialType) async {
    String? email;

    try {
      /// Declaracoes

      final SocialNetworkModel socialModel;
      final AuthCredential authCredential;
      final firebaseAuth = FirebaseAuth.instance;

      switch (socialType) {
        case SocialType.google:
          socialModel = await _socialRepository.googleLogin();
          authCredential = GoogleAuthProvider.credential(
            accessToken: socialModel.accessToken,
            idToken: socialModel.id,
          );
          break;
        case SocialType.facebook:
          socialModel = await _socialRepository.facebookLogin();
          authCredential = FacebookAuthProvider.credential(
            socialModel.accessToken,
          );
          break;
      }

      email = socialModel.email;

      /// Processo comum do login com rede social
      await firebaseAuth.signInWithCredential(
        authCredential,
      );

      final accessToken = await _userRepository.socialLogin(socialModel);

      await _saveAccessToken(accessToken);
      await _confirmLogin();
      await _getUserData();
    }
    on FirebaseAuthException catch(e, s) {
      if (e.code == 'account-exists-with-different-credential') {
        if (email != null) {
          final fetchMethods = await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);

          var socialNetwork = '';
          if (fetchMethods.contains('google.com')) {
            socialNetwork = 'Google';
          }

          _log.error('Usuário registrado com outro método de login ($socialNetwork, $socialType)');
          throw UserExistsException('Você se registrou com $socialNetwork, por favor utilize esse mesmo método');
        }
      }

      _log.error('Erro ao realizar login no Firebase', e, s);
      throw Failure(message: 'Erro ao realizar login no Firebase');
    } on SocialLoginCanceled {
      _log.error('Login cancelado');
      rethrow;
    }
  }
    
}
