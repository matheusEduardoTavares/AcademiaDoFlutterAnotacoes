import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/modules/auth/login/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final controller = Provider.of<LoginController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('LoginPage'),
      ),
    );
  }
}