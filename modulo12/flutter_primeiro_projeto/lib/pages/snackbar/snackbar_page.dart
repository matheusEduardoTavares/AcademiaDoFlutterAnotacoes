import 'package:flutter/material.dart';

class SnackbarPage extends StatelessWidget {

  const SnackbarPage({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('SnackBars'),),
           body: Center(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 ElevatedButton(onPressed: () {
                   final snackBar = SnackBar(
                     content: Text('Usuário salvo com sucesso'),
                     backgroundColor: Colors.amber,
                   );
                   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                 }, child: Text('Simple Snackbar')),
                 ElevatedButton(onPressed: () {
                   final snackBar = SnackBar(
                     content: Text('Usuário salvo com sucesso'),
                     backgroundColor: Colors.amber,
                     action: SnackBarAction(
                       label: 'Desfazer',
                       onPressed: () {
                         debugPrint('Clicado');
                       },
                       textColor: Colors.blue,
                     ),
                   );

                   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                   ScaffoldMessenger.of(context).removeCurrentSnackBar();
                   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                 }, child: Text('Action Snackbar')),
               ],
             ),
           ),
       );
  }
}