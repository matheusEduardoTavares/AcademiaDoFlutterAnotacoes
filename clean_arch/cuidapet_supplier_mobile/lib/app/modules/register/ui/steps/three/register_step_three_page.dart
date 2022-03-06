import 'package:cuidapet_supplier_mobile/app/modules/login/ui/widgets/cuidapet_default_button.dart';
import 'package:cuidapet_supplier_mobile/app/modules/login/ui/widgets/cuidapet_text_form_field.dart';
import 'package:flutter/material.dart';

class RegisterStepThreePage extends StatelessWidget {
  const RegisterStepThreePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const Text('Cadastro realizado com sucesso!'),
            TextButton(
              onPressed: () {}, 
              child: const Text('Clique aqui e faça o login')
            )
          ],
        ),
      ),
    );
  }
}