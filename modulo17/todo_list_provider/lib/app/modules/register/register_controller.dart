import 'package:flutter/widgets.dart';
import 'package:todo_list_provider/app/exception/auth_exceptions.dart';
import 'package:todo_list_provider/app/services/user/user_service.dart';

class RegisterController extends ChangeNotifier {
  RegisterController({
    required UserService userService,
  }) : _userService = userService;

  final UserService _userService;
  String? error;
  bool success = false;

  Future<void> registerUser(String email, String password) async {
    try {
      error = null;
      success = false;
      notifyListeners();
      
      final user = await _userService.register(email, password);
      
      if (user != null) {
        success = true;
        /// sucesso
      }
      else {
        /// erro
        error = 'Erro ao registrar usuário';
      }
    } on AuthExceptions catch (e) {
      error = e.message;
    }
    finally {
      notifyListeners();
    }
  }
}