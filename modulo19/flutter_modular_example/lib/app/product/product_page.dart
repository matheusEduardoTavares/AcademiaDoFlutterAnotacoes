import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_example/app/category/model/price_model.dart';

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
          Text(nome ?? 'Nome não enviado'),
          TextButton(
            onPressed: () {
              final model = Modular.get<PriceModel>();
              debugPrint('model.hashCode = ${model.hashCode}');
            }, 
            child: Text('Get Dependency')
          ),
        ],
      ),
    );
  }
}