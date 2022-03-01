import 'package:cuidapet_supplier_mobile/app/modules/login/ui/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {

   @override
   final List<Bind> binds = [];

   @override
   final List<ModularRoute> routes = [
     ChildRoute(
       Modular.initialRoute, 
       child: (_, args) => const LoginPage(),
      )
   ];

}