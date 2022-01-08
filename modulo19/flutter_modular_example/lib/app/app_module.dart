import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_example/app/category/category_module.dart';
import 'package:flutter_modular_example/app/product/product_module.dart';
import 'package:flutter_modular_example/app/splash/splash_page.dart';

class AppModule extends Module {
  ///Dependências
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(
      Modular.initialRoute, // '/' 
      child: (context, args) => SplashPage(),
    ),
    ModuleRoute(
      '/category', 
      module: CategoryModule()
    ),
    ModuleRoute(
      '/product',
      module: ProductModule()
    ),
  ];
}

/// - Hierarquia
    /// Produto
        /// Estoque
            /// Fornecedor
        /// X
        /// Y