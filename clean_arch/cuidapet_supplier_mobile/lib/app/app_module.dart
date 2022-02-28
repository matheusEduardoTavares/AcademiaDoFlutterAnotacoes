import 'package:cuidapet_supplier_mobile/app/modules/core/core_module.dart';
import 'package:cuidapet_supplier_mobile/app/modules/home/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<Module> get imports => [
    CoreModule(),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(
      Modular.initialRoute, 
      child: (_, args) => const HomePage()
    ),
  ];
}