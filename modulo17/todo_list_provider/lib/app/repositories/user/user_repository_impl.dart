import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
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
    on FirebaseAuthException catch (err, s) {
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
  
}