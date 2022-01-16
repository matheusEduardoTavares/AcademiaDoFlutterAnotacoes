import 'package:cuidapet_mobile/app/models/confirm_login_model.dart';
import 'package:cuidapet_mobile/app/models/user_model.dart';

abstract class UserRepository {
  Future<void> register(String email, String password);

  ///Retorna o access token
  Future<String> login(String login, String password);

  Future<ConfirmLoginModel> confirmLogin();
  Future<UserModel> getUserLogged();
}