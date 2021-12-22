import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomePageStateless extends StatelessWidget {
  var texto = 'Estou no StatelessWidget';

  HomePageStateless({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(texto),
          TextButton(
            onPressed: () {
              texto = 'Alterei o texto do StatelessWidget';
            },
            child: const Text('Alterei o texto do StatelessWidget'),
          ),
        ],
      ),
    );
  }
}