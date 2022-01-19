import 'package:cuidapet_mobile/app/core/ui/extensions/size_screen_extension.dart';
import 'package:cuidapet_mobile/app/core/ui/extensions/theme_extension.dart';
import 'package:cuidapet_mobile/app/modules/auth/login/login_controller.dart';
import 'package:cuidapet_mobile/app/modules/auth/login/widgets/login_form.dart';
import 'package:cuidapet_mobile/app/modules/auth/login/widgets/login_register_buttons.dart';
import 'package:flutter/material.dart';
    
class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
    required LoginController controller,
  }) : 
  _controller = controller,
  super(key: key);

  final LoginController _controller;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // @override
  // void initState() {
  //   super.initState();

    // WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      // Loader.show();
      // Future.delayed(const Duration(seconds: 2), () {
      //   Loader.hide();
      // });

      // Messages.alert('Mensagem de Alerta');
      // Future.delayed(const Duration(seconds: 2), () {
      //   Messages.info('Mensagem de Info');
      // });
    // });

    // PushNotification().getDeviceToken().then((value) => print('deviceToken = $value'));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 1.statusBarHeight + 54, left: 20, right: 20),
          width: 1.sw,
          height: 1.sh,
          child: Column(
            children: [
              // Text(Environments.param('base_url') ?? 'Não configurado'),
              Image.asset(
                'assets/images/logo.png',
                width: 150.w,
                fit: BoxFit.fill,
              ),
              LoginForm(
                controller: widget._controller,
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: context.primaryColor,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'OU',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                        color: context.primaryColor
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: context.primaryColor,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              LoginRegisterButtons(
                loginController: widget._controller,
              ),
            ],
          ),
        ),
      ),
    );
  }
}