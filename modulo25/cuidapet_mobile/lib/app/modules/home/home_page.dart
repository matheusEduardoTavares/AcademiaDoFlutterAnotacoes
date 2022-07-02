import 'package:cuidapet_mobile/app/core/rest_client/rest_client.dart';
import 'package:cuidapet_mobile/app/modules/core/auth/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              child: const Text('Teste Refresh Token'),
              onPressed: () async {
                final result = await Modular.get<RestClient>().auth().get('/categories/');
                debugPrint(result.data?.toString());
              },
            ),
            TextButton(
              child: const Text('Logout'),
              onPressed: () {
                Modular.get<AuthStore>().logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}