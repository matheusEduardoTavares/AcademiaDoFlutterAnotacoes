import 'package:cuidapet_supplier_mobile/app/core/extensions/screen_size_extensions.dart';
import 'package:cuidapet_supplier_mobile/app/core/extensions/theme_extensions.dart';
import 'package:cuidapet_supplier_mobile/app/modules/login/ui/widgets/cuidapet_default_button.dart';
import 'package:cuidapet_supplier_mobile/app/modules/login/ui/widgets/cuidapet_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.primaryColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: 1.sw,
              height: .95.sh,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/login_background.png',
                  ),
                  fit: BoxFit.fill
                )
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 1.statusBarHeight + 30,
                left: 10,
                right: 10,
              ),
              width: double.infinity,
              child: Form(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      width: 150.w,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(height: 15,),
                    CuidapetTextFormField(
                      label: 'E-mail',
                    ),
                    const SizedBox(height: 10,),
                    CuidapetTextFormField(
                      label: 'Senha',
                      obscureText: true,
                    ),
                    const SizedBox(height: 10,),
                    CuidapetDefaultButton(
                      label: 'Login',
                      onPressed: () {},
                    ),
                    const SizedBox(height: 10,),
                    TextButton(
                      onPressed: () {
                        Modular.to.pushNamed('/register');
                      }, 
                      child: const Text('Cadastrar PET')
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}