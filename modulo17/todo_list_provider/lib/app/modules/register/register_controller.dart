import 'package:todo_list_provider/app/core/notifier/default_change_notifier.dart';
import 'package:todo_list_provider/app/exception/auth_exceptions.dart';
import 'package:todo_list_provider/app/services/user/user_service.dart';

class RegisterController extends DefaultChangeNotifier {
  RegisterController({
    required UserService userService,
  }) : _userService = userService;

  final UserService _userService;

  Future<void> registerUser(String email, String password) async {
    try {
      showLoadingAndResetState();
      notifyListeners();
      
      final user = await _userService.register(email, password);
      
      if (user != null) {
        success();
      }
      else {
        setError('Erro ao registrar usuário');
      }
    } on AuthExceptions catch (e) {
      setError(e.message);
    }
    finally {
      hideLoading();
      notifyListeners();
    }
  }
}