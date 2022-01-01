
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/core/modules/todo_list_module.dart';
import 'package:todo_list_provider/app/modules/auth/login/login_controller.dart';
import 'package:todo_list_provider/app/modules/auth/login/login_page.dart';
import 'package:todo_list_provider/app/modules/register/register_controller.dart';
import 'package:todo_list_provider/app/modules/register/register_page.dart';

class AuthModule extends TodoListModule{
  AuthModule() : super(
    routers: {
      '/login': (_) => LoginPage(),
      '/register': (_) => RegisterPage(),
    },
    bindings: [
      ChangeNotifierProvider(create: (_) => LoginController()),
      ChangeNotifierProvider(create: (context) => RegisterController(userService: context.read())),
    ],
  );
}