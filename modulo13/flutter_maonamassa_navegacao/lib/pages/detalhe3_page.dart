import 'package:flutter/material.dart';

class Detalhe3Page extends StatelessWidget {
  const Detalhe3Page({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhe 3'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).pop(
              'Iphone 13'
            );
          },
          child: const Text('Voltar'),
        ),
      ),
    );
  }
}