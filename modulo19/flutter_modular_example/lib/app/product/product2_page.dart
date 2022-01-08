import 'package:flutter/material.dart';

class Product2Page extends StatelessWidget {
  const Product2Page({ 
    Key? key,
    this.nome,
  }) : super(key: key);

  final String? nome;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product2Page'),
      ),
      body: Column(
        children: [
          Text(nome ?? 'Nome não enviado')
        ],
      ),
    );
  }
}