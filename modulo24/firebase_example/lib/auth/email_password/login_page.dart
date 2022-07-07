import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  Future<void> loginUser() async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailEC.text, 
      password: passwordEC.text,
    );

    // credential.user?.sendEmailVerification();

    // print(credential.user?.email);
    // print(credential.user?.emailVerified);

    final user = credential.user;
    var message = '';

    if (user != null && !user.emailVerified) {
      message = 'E-mail não confirmado, por favor verifique o seu e-mail';
    }
    else {
      message = 'E-mail validado com sucesso';
    }

    ///Atualizando dados do usuário via firebase:
    // user.updateEmail
    // user.updatePhotoURL;
    // user.updatePassword;
    // await user?.updateDisplayName('Usuário Teste');
    debugPrint(credential.user?.displayName);
    debugPrint(credential.user?.email);
    debugPrint(credential.user?.emailVerified.toString());

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message)
      ),
    );
  }

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Login de usuário'),),
           body: SingleChildScrollView(
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                children: [
                  TextField(
                    controller: emailEC,
                    decoration: const InputDecoration(
                      label: Text('e-mail')
                    ),
                  ),
                  TextField(
                    controller: passwordEC,
                    decoration: const InputDecoration(
                      label: Text('senha')
                    ),
                  ),
                  ElevatedButton(
                    onPressed: loginUser, 
                    child: const Text('Login Usuário')
                  )
                ],
               ),
             ),
           ),
       );
  }

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();

    super.dispose();
  }
}