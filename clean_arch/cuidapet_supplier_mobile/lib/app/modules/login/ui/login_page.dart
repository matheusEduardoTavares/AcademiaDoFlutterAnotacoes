import 'package:cuidapet_supplier_mobile/app/core/extensions/screen_size_extensions.dart';
import 'package:cuidapet_supplier_mobile/app/core/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';

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
                    TextFormField(),
                    const SizedBox(height: 10,),
                    TextFormField(),
                    const SizedBox(height: 10,),
                    ElevatedButton(
                      onPressed: () {}, 
                      child: const Text('Login')
                    ),
                    const SizedBox(height: 10,),
                    TextButton(
                      onPressed: () {}, 
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