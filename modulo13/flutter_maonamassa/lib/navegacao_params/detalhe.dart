import 'package:flutter/material.dart';

class Detalhe extends StatefulWidget {

  const Detalhe({ Key? key }) : super(key: key);

  @override
  State<Detalhe> createState() => _DetalheState();
}

class _DetalheState extends State<Detalhe> {
  late int id;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final param = ModalRoute.of(context)?.settings.arguments as Map<String, int>?;
    id = param?['id'] ?? 0;
  }

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Detalhe'),),
           body: Center(
             child: Text('O ID do produto é $id'),
           ),
       );
  }
}