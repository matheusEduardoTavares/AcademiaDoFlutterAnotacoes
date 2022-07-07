import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_example/auth/email_password/login_page.dart';
import 'package:firebase_example/auth/email_password/register_page.dart';
import 'package:firebase_example/auth/show_user.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/auth/email_password/register': (_) => const RegisterPage(),
        '/auth/email_password/login': (_) => const LoginPage(),
        '/auth/show_user': (_) => const ShowUser(),
      },
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final StreamSubscription<User?> updateUserStream;

  @override
  void initState() {
    super.initState();

    updateUserStream = FirebaseAuth.instance.authStateChanges().listen(
      (User? user) {
        debugPrint('Usuário logado? ${user != null}');
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/auth/email_password/register');
              }, 
              child: const Text('Register User Email / Password'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/auth/email_password/login');
              }, 
              child: const Text('Login User Email / Password'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/auth/show_user');
              }, 
              child: const Text('Show User Logged'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    updateUserStream.cancel();
  }
}