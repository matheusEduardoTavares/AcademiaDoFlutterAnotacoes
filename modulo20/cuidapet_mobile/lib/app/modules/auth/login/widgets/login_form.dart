import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({ Key? key }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(),
        TextFormField(),
        const SizedBox(height: 20,),
        Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          height: 58.0,
          child: ElevatedButton(
            onPressed: () {}, 
            child: const Text('Entrar'),
          ),
        ),
      ],
    );
  }
}