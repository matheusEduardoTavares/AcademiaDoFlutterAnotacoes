import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_example/app/product/product_page.dart';

class ProductModule extends Module {
   @override
   final List<Bind> binds = [];

   @override
   final List<ModularRoute> routes = [
     ChildRoute(
       ///Route Param obrigatório:
       /// '/:nome/xyz'
       ///Até pode ser usado de forma opcional
       ///mas geralmente usamos ele como obrigatório
       '/:nome/xyz', 
       child: (_, args) => ProductPage(
         nome: args.params['nome'],
       ),
      ),
     ChildRoute(
       ///Geralmente usamos como opcional os 
       ///query params
       '/xyz', 
       child: (_, args) => ProductPage(
         nome: args.queryParams['nome'],
       ),
      ),
   ];
}