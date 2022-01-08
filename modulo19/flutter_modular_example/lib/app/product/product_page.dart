import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({ 
    Key? key,
    this.nome,
  }) : super(key: key);

  ///RouteParams: Modular.args.params
  ///QueryParams: Modular.args?.queryParams
  
  final String? nome;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProductPage'),
      ),
      body: Column(
        children: [
          // Text(Modular.args?.params['nome'] ?? 'Nome não enviado')
          Text(nome ?? 'Nome não enviado')
        ],
      ),
    );
  }
}