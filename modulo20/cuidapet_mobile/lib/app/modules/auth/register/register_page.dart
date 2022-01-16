import 'package:cuidapet_mobile/app/core/ui/extensions/size_screen_extension.dart';
import 'package:cuidapet_mobile/app/core/ui/validators/validators.dart';
import 'package:cuidapet_mobile/app/core/ui/widgets/cuidapet_default_button.dart';
import 'package:cuidapet_mobile/app/core/ui/widgets/cuidapet_text_form_field.dart';
import 'package:cuidapet_mobile/app/modules/auth/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';
    
class RegisterPage extends StatefulWidget {
  const RegisterPage({
    Key? key,
    required RegisterController controller,
  }) : 
  _controller = controller,
  super(key: key);

  final RegisterController _controller;

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _loginEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _confirmPasswordEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastre-se'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 1.statusBarHeight + 30, left: 20, right: 20),
          width: 1.sw,
          height: 1.sh - 1.statusBarHeight - kToolbarHeight - 24,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 150.w,
                  fit: BoxFit.fill,
                ),
                CuidapetTextFormField(
                  label: 'Login',
                  controller: _loginEC,
                  validator: Validatorless.multiple([
                    Validatorless.required('Login obrigatório'),
                    Validatorless.email('E-mail inválido')
                  ]),
                ),
                const SizedBox(height: 10,),
                CuidapetTextFormField(
                  label: 'Senha',
                  controller: _passwordEC,
                  obscureText: true,
                  validator: Validatorless.multiple([
                    Validatorless.required('Senha obrigatória'),
                    Validatorless.min(6, 'Senha precisa ter pelo menos 6 caracteres')
                  ]),
                ),
                const SizedBox(height: 10,),
                CuidapetTextFormField(
                  controller: _confirmPasswordEC,
                  label: 'Confirmar Senha',
                  obscureText: true,
                  validator: Validatorless.multiple([
                    Validatorless.required('Confirmar Senha obrigatória'),
                    Validatorless.min(6, 'Senha precisa ter pelo menos 6 caracteres'),
                    Validators.compare(_passwordEC, 'Senha e confirma senha não são iguais'),
                  ]),
                ),
                const SizedBox(height: 10,),
                CuidapetDefaultButton(
                  label: 'Cadastrar',
                  onPressed: () {
                    final formValid = _formKey.currentState?.validate() ?? false;
                    if (formValid) {
                      widget._controller.register(_loginEC.text, _passwordEC.text);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _loginEC.dispose();
    _passwordEC.dispose();
    _confirmPasswordEC.dispose();

    super.dispose();
  }
}