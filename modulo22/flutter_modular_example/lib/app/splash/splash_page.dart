import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SplashPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                ///Os dois funcionam
                // Navigator.of(context).pushNamed('/category');
                ///Recupera pelo Modular.args.data
                Modular.to.pushNamed(
                  '/category',
                  arguments: 'Categoria selecionada @@@@'
                );
              }, 
              child: Text('Categoria Module')
            ),
            TextButton(
              onPressed: () {
                ///Recupera pelo Modular.args.params
                Modular.to.pushNamed(
                  '/product/Produto_X/xyz',
                );
              }, 
              child: Text('Product Module')
            ),
            TextButton(
              onPressed: () {
                ///Recupera pelo Modular.args.queryParams
                Modular.to.pushNamed(
                  '/product/xyz?nome=Produto_X',
                );
              }, 
              child: Text('Product2 Query Param Module')
            ),
            TextButton(
              onPressed: () {
                Modular.to.pushNamed(
                  '/category/product/produtoX/xyz',
                );
              }, 
              child: Text('Product in Category Module')
            ),
          ],
        ),
      ),
    );
  }
}