import 'package:cuidapet_supplier_mobile/app/modules/core/auth/data/drivers/auth_token_driver_impl.dart';
import 'package:cuidapet_supplier_mobile/app/modules/core/auth/domain/repositories/auth_token_repository.dart';
import 'package:cuidapet_supplier_mobile/app/modules/core/auth/domain/usecases/check_user_logged_usecase_impl.dart';
import 'package:cuidapet_supplier_mobile/app/modules/core/auth/infra/drivers/auth_token_driver.dart';
import 'package:cuidapet_supplier_mobile/app/modules/core/auth/infra/repositories/auth_token_repository_impl.dart';
import 'package:cuidapet_supplier_mobile/app/modules/core/auth/presenter/usecases/check_user_logged_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthCoreModule extends Module {

  @override
  final List<Bind> binds = [
    Bind.lazySingleton<AuthTokenDriver>(
      (i) => AuthTokenDriverImpl(localStorage: i()),
      export: true,
    ),
    Bind.lazySingleton<AuthTokenRepository>(
      (i) => AuthTokenRepositoryImpl(authTokenDriver: i()),
      export: true,
    ),
    Bind.lazySingleton<CheckUserLoggedUsecase>(
      (i) => CheckUserLoggedUsecaseImpl(authTokenRepository: i()), 
      export: true
    ),
   ];
}