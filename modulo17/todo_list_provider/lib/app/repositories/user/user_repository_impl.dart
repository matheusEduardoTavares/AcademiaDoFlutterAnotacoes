import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo_list_provider/app/exception/auth_exceptions.dart';
import 'package:todo_list_provider/app/repositories/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({
    required FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  final FirebaseAuth _firebaseAuth;

  @override
  Future<User?> register(String email, String password) async {
    try {
      final userCredencial = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );

      return userCredencial.user;
    }
    on FirebaseAuthException catch (err) {
      // debugPrint(err.toString());
      // debugPrint(s.toString());
      if (err.code == 'email-already-in-use') {
        final loginTypes = await _firebaseAuth.fetchSignInMethodsForEmail(email);
        if (loginTypes.contains('password')) {
          throw AuthExceptions(message: 'E-mail já utilizado, por favor escolha outro e-mail');
        }
        else {
          throw AuthExceptions(message: 'Você se cadastrou no TodoList pelo Google, por favor utilize ele para entrar!!!');
        }
      }
      else {
        throw AuthExceptions(message: err.message ?? 'Erro ao registrar usuário');
      }
    }
  }

  @override
  Future<User?> login(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, 
        password: password
      );
      
      return userCredential.user;
    } on PlatformException catch (e) {
      throw AuthExceptions(
        message: e.message ?? 'Erro ao realizar login',
      );
    }
    on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        throw AuthExceptions(
          message: 'Login ou senha inválidos',
        );
      }

      throw AuthExceptions(
        message: e.message ?? 'Erro ao realizar login',
      );
    }
  }

  @override
  Future<void> forgotPassword(String email) async {
    try {
      var loginMethods = await _firebaseAuth.fetchSignInMethodsForEmail(email);
      
      if (loginMethods.contains('password')) {
        await _firebaseAuth.sendPasswordResetEmail(email: email);
      }
      else if (loginMethods.contains('google')){
        throw AuthExceptions(message: 'Cadastro realizado com o google, não pode ser resetado a senha');
      }
      else {
        throw AuthExceptions(message: 'E-mail não cadastrado');
      }
    } on PlatformException catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      throw AuthExceptions(message: 'Erro ao resetar senha');
    }
  }

  @override
  Future<User?> googleLogin() async {
    List<String>? loginMethods;
    try {
      final googleSignIn = GoogleSignIn();
      final googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        loginMethods = await _firebaseAuth
          .fetchSignInMethodsForEmail(googleUser.email);
      
        if (loginMethods.contains('password')) {
          throw AuthExceptions(message: 'Você utilizou o e-mail para cadastro no TodoList, caso tenha esquecido sua senha por favor clique no link esqueci minha senha');
        }
        else {
          final googleAuth = await googleUser.authentication;
          final firebaseCredential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          );
      
          var userCredential = await _firebaseAuth.signInWithCredential(
            firebaseCredential,
          );
      
          return userCredential.user;
        }
      }
    } on FirebaseAuthException catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());

      if (e.code == 'account-exists-with-different-credential') {
        throw AuthExceptions(message: 'Login inválido. Você se registrou no TodoList com os seguintes provedores: ${loginMethods?.join(',')}');
      }

      throw AuthExceptions(message: 'Erro ao realizar login');
    }
  }

  @override
  Future<void> logout() async {
    await GoogleSignIn().signOut();
    await _firebaseAuth.signOut();
  }

  @override
  Future<void> updateDisplayName(String name) async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      user.updateDisplayName(name);
      await user.reload();
    }
  }
  
}