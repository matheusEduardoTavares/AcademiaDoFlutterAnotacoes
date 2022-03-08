import 'package:cuidapet_supplier_mobile/app/core/ui/widgets/cuidapet_default_button.dart';
import 'package:cuidapet_supplier_mobile/app/core/ui/widgets/cuidapet_text_form_field.dart';
import 'package:cuidapet_supplier_mobile/app/modules/register/ui/steps/one/controller/register_step_one_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:validatorless/validatorless.dart';

class RegisterStepOnePage extends StatefulWidget {
  const RegisterStepOnePage({ 
    required RegisterStepOneController controller,
    Key? key 
  }) : 
  _controller = controller,
  super(key: key);

  final RegisterStepOneController _controller;

  @override
  State<RegisterStepOnePage> createState() => _RegisterStepOnePageState();
}

class _RegisterStepOnePageState extends State<RegisterStepOnePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CuidapetTextFormField(
              label: 'Nome Estabelecimento',
              controller: _nameEC,
              validator: Validatorless.required('Nome obrigatório'),
            ),
            const SizedBox(height: 10,),
            CuidapetTextFormField(
              label: 'E-mail',
              controller: _emailEC,
              validator: Validatorless.multiple([
                Validatorless.required('E-mail obrigatório'),
                Validatorless.email('E-mail inválido'),
              ]),
            ),
            LayoutBuilder(
              builder: (_, constraints) => Row(
                children: [
                  SizedBox(
                    width: constraints.maxWidth / 2,
                    child: CuidapetDefaultButton(
                      label: 'Cancelar',
                      color: Colors.grey,
                      onPressed: () => Modular.to.pop(),
                    ),
                  ),
                  SizedBox(
                    width: constraints.maxWidth / 2,
                    child: CuidapetDefaultButton(
                      label: 'Próximo',
                      onPressed: () {
                        final formValid = _formKey.currentState?.validate() ?? false;

                        if (formValid) {
                          var name = _nameEC.text;
                          var email = _emailEC.text;
                          widget._controller.nextStep(
                            name: name,
                            email: email,
                          );
                        }
                      },
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

  @override
  void dispose() {
    _emailEC.dispose();
    _nameEC.dispose();

    super.dispose();
  }
}