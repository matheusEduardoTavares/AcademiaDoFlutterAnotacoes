import 'package:cuidapet_mobile/app/core/exceptions/failure.dart';
import 'package:cuidapet_mobile/app/core/helpers/logger.dart';
import 'package:cuidapet_mobile/app/core/services/user/user_service.dart';
import 'package:cuidapet_mobile/app/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserServiceImpl implements UserService {
  UserServiceImpl({
    required UserRepository userRepository,
    required Logger log,
  }) : 
    _userRepository = userRepository,
    _log = log;

  final UserRepository _userRepository;
  final Logger _log;

  @override
  Future<void> register(String email, String password) async {
    try {
      await _userRepository.register(email, password);
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e, s) {
      _log.error('Erro ao criar usuário no FirebaseAuth', e, s);

      throw Failure(message: 'Erro ao criar usuário no FirebaseAuth');
    }
  }
  
}
