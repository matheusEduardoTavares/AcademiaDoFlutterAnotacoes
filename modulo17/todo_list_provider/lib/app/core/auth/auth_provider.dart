
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_list_provider/app/core/navigator/todo_list_navigator.dart';
import 'package:todo_list_provider/app/services/user/user_service.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth;
  final UserService _userService;

  AuthProvider({
    required FirebaseAuth firebaseAuth,
    required UserService userService,
  }) : 
    _firebaseAuth = firebaseAuth,
    _userService = userService;

  Future<void> logout() => _userService.logout();

  User? get user => _firebaseAuth.currentUser;

  void loadListener() {
    ///FirebaseAuth.instance.currentUser.reload() faz com que esse listen
    ///seja chamado
    _firebaseAuth.userChanges().listen((_) {
      notifyListeners();
    });

    ///Fica escutando os logins / logouts
    ///O idTokenChanges é chamado sempre que
    ///algum evento de refresh dentro das estruturas
    ///do firebase são rodados
    // _firebaseAuth.idTokenChanges().listen((user) {
    ///Já o authStateChanges checa somente se é 
    ///signin ou signout
    _firebaseAuth.authStateChanges().listen((user) {
      if (user != null) {
        TodoListNavigator.to.pushNamedAndRemoveUntil('/home', (route) => false);
      }
      else {
        TodoListNavigator.to.pushNamedAndRemoveUntil('/login', (route) => false);
      }
    });
  }
}