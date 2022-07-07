import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ShowUser extends StatefulWidget {

  const ShowUser({ Key? key }) : super(key: key);

  @override
  State<ShowUser> createState() => _ShowUserState();
}

class _ShowUserState extends State<ShowUser> {
  User? user;

  @override
  void initState() {
    super.initState();

    user = FirebaseAuth.instance.currentUser;
  }

   @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Usuário logado'),),
      body: Column(
        children: [
          Text(user?.displayName ?? ''),
          Text(user?.email ?? ''),
          Text(user?.photoURL ?? ''),
          TextButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            }, 
            child: const Text('Sair')
          )
        ],
      ),
    );
  }
}