import 'package:cuidapet_supplier_mobile/app/modules/register/presenter/controller/register_controller.dart';
import 'package:cuidapet_supplier_mobile/app/modules/register/ui/register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterModule extends Module {

   @override
   final List<Bind> binds = [
     Bind.lazySingleton((i) => RegisterController()),
   ];

   @override
   final List<ModularRoute> routes = [
     ChildRoute(
       Modular.initialRoute, 
       child: (_, args) => RegisterPage(
         controller: Modular.get(),
       )
      )
   ];

}