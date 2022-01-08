import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_example/app/category/category_page.dart';
import 'package:flutter_modular_example/app/product/product_module.dart';

class CategoryModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(
      Modular.initialRoute, 
      child: (context, args) => CategoryPage(
        categoria: args.data,
      ),
    ),
    ModuleRoute('/product', module: ProductModule()),
  ];
}