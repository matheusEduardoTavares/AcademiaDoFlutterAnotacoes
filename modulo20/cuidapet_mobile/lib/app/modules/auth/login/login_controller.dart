import 'package:cuidapet_mobile/app/core/exceptions/user_notfound_exception.dart';
import 'package:cuidapet_mobile/app/core/helpers/logger.dart';
import 'package:cuidapet_mobile/app/core/ui/widgets/loader.dart';
import 'package:cuidapet_mobile/app/core/ui/widgets/messages.dart';
import 'package:cuidapet_mobile/app/models/social_type.dart';
import 'package:cuidapet_mobile/app/services/user/user_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  _LoginControllerBase({
    required UserService userService,
    required Logger log,
  }) : 
  _log = log,
  _userService = userService;

  final UserService _userService;
  final Logger _log;

  Future<void> login(String login, String password) async {
    try {
      Loader.show();
      await _userService.login(login, password);
      Loader.hide();
      Modular.to.navigate('/auth/');
    } on UserNotfoundException {
      Loader.hide();
      Messages.alert('Login ou senha inválidos');
    } catch (e, s) {
      Loader.hide();
      _log.error('Erro ao realizar login', e , s);
      Messages.alert('Erro ao realizar login, tente novamente mais tarde!!!');
    }
  }

  Future<void> socialLogin(SocialType type) async {
    try {
      Loader.show();
      await _userService.socialLogin(type);
      Loader.hide();
      Modular.to.navigate('/auth/');
    }
    catch (e, s) {
      Loader.hide();
      _log.error('Erro ao realizar login', e, s);
      Messages.alert('Erro ao realizar login');
    }
  }
}