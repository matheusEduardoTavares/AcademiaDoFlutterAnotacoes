import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_example/app/category/model/category_controller.dart';

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
        child: Column(
          children: [
            Text(widget.categoria ?? 'Não foi enviado a categoria'),
            TextButton(
              onPressed: () {
                var controller = Modular.get<CategoryController>();
                debugPrint('CategoryController hashCode ${controller.hashCode}');
              }, 
              child: Text('Get Controller')
            ),
          ],
        ),
      ),
    );
  }
}