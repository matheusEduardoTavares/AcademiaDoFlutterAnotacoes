import 'package:bloc/bloc.dart';
import 'package:cuidapet_supplier_mobile/app/modules/auth/home/presenter/controller/auth_home_state.dart';
import 'package:cuidapet_supplier_mobile/app/modules/core/auth/presenter/usecases/check_user_logged_usecase.dart';

class AuthHomeController extends Cubit<AuthHomeState> {
  AuthHomeController({
    required CheckUserLoggedUsecase checkUserLoggedUsecase,
  }) : 
    _checkUserLoggedUsecase = checkUserLoggedUsecase,
    super(AuthHomeState.initial());

  final CheckUserLoggedUsecase _checkUserLoggedUsecase;

  Future<void> checkIsLogged() async {
    final userLogged = await _checkUserLoggedUsecase.execute();
    AuthStatus authStatus;

    if (userLogged) {
      authStatus = AuthStatus.logged;
    }
    // ignore: dead_code
    else {
      authStatus = AuthStatus.unlogged;
    }

    emit(state.copyWith(authStatus: authStatus));
  }
}