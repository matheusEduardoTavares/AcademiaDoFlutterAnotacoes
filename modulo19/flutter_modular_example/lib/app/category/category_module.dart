import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_example/app/category/category_page.dart';
import 'package:flutter_modular_example/app/category/model/category_controller.dart';
import 'package:flutter_modular_example/app/category/model/price_model.dart';
import 'package:flutter_modular_example/app/product/product_module.dart';

class CategoryModule extends Module {
  @override
  List<Bind<Object>> get binds => [
    // Bind((i) => CategoryController(), isLazy: true, isSingleton: false),

    Bind.lazySingleton((i) => PriceModel()),
    ///lazy = true | singleton = true
    Bind.lazySingleton((i) => CategoryController(
      // priceModel: Modular.get(),
      // priceModel: i.get(),
      priceModel: i(),
    )),
    ///lazy = false | singleton = true
    // Bind.singleton((i) => CategoryController()),
    ///lazy = true | singleton = false
    // Bind.factory((i) => CategoryController()),
  ];

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