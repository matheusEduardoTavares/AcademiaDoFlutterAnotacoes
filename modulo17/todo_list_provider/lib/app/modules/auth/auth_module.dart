
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/core/modules/todo_list_module.dart';
import 'package:todo_list_provider/app/modules/auth/login/login_controller.dart';
import 'package:todo_list_provider/app/modules/auth/login/login_page.dart';

class AuthModule extends TodoListModule{
  AuthModule() : super(
    routers: {
      '/login': (_) => LoginPage(),
    },
    bindings: [
      ChangeNotifierProvider(create: (_) => LoginController()),
    ],
  );
}