import 'package:cuidapet_supplier_mobile/app/modules/login/ui/widgets/cuidapet_default_button.dart';
import 'package:cuidapet_supplier_mobile/app/modules/login/ui/widgets/cuidapet_text_form_field.dart';
import 'package:flutter/material.dart';

class RegisterStepTwoPage extends StatelessWidget {
  const RegisterStepTwoPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CuidapetTextFormField(
              label: 'Senha'
            ),
            const SizedBox(height: 10,),
            CuidapetTextFormField(
              label: 'Confirma senha'
            ),
            const SizedBox(height: 10,),
            DropdownButtonFormField<dynamic>(
              decoration: InputDecoration(
                labelText: 'Categoria',
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)
                )
              ),
              items: const [], 
              onChanged: (_) {}
            ),
            LayoutBuilder(
              builder: (_, constraints) => Row(
                children: [
                  SizedBox(
                    width: constraints.maxWidth / 2,
                    child: CuidapetDefaultButton(
                      label: 'Cancelar',
                      color: Colors.grey,
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    width: constraints.maxWidth / 2,
                    child: CuidapetDefaultButton(
                      label: 'Próximo',
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}