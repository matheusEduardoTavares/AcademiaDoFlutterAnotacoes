import 'package:flutter/material.dart';

class DetalhePage extends StatelessWidget {

  const DetalhePage({ 
    Key? key,
    required this.parametro,
  }) : super(key: key);

  final String parametro;

   @override
   Widget build(BuildContext context) {
    // final parametro = ModalRoute.of(context)?.settings.arguments as String?;
       return Scaffold(
           appBar: AppBar(title: const Text('Detalhe'),),
           body: Center(
             child: Text(parametro),
           ),
       );
  }
}