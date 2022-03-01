import 'package:cuidapet_supplier_mobile/app/modules/auth/home/presenter/controller/auth_home_controller.dart';
import 'package:cuidapet_supplier_mobile/app/modules/auth/home/ui/auth_home_page.dart';
import 'package:cuidapet_supplier_mobile/app/modules/core/auth/auth_core_module.dart';
import 'package:cuidapet_supplier_mobile/app/modules/home/home_module.dart';
import 'package:cuidapet_supplier_mobile/app/modules/login/login_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AuthHomeController(checkUserLoggedUsecase: i())),
  ];

  @override
  List<Module> get imports => [
    AuthCoreModule(),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute, 
      child: (_, args) => AuthHomePage(authHomeController: Modular.get(),)
    ),
    ModuleRoute(
      '/login', 
      module: LoginModule(),
    ),
    ModuleRoute(
      '/home', 
      module: HomeModule(),
    ),
  ];

}