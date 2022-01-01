import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
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
  
}