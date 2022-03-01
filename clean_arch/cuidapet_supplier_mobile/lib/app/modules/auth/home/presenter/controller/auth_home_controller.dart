import 'package:bloc/bloc.dart';
import 'package:cuidapet_supplier_mobile/app/modules/auth/home/presenter/controller/auth_home_state.dart';

class AuthHomeController extends Cubit<AuthHomeState> {
  AuthHomeController() : super(AuthHomeState.initial());

  Future<void> checkIsLogged() async {
    await Future.delayed(const Duration(seconds: 3));
    const userLogged = true;
    AuthStatus authStatus;

    // ignore: dead_code
    if (userLogged) {
      authStatus = AuthStatus.logged;
    }
    else {
      authStatus = AuthStatus.unlogged;
    }

    emit(state.copyWith(authStatus: authStatus));
  }
}