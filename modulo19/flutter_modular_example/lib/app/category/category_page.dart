import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  CategoryPage({ 
    Key? key,
    this.categoria,
  }) : 
    // categoria = Modular.args?.data,
    super(key: key);

  final String? categoria;

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CategoryPage'),
      ),
      body: Center(
        ///Uma forma de recuperar argumentos passados
        ///na navegação é com Modular.args
        // child: Text(Modular.args?.data ?? 'Não foi enviado a categoria'),
        ///Outra forma:
        child: Text(widget.categoria ?? 'Não foi enviado a categoria'),
      ),
    );
  }
}