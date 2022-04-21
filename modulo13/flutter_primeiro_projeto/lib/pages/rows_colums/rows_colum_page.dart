import 'package:flutter/material.dart';

class RowsColumPage extends StatelessWidget {

  const RowsColumPage({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Rows & Columns'),),
           body: Container(
             width: 400,
             color: Colors.red,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //  crossAxisAlignment: CrossAxisAlignment.stretch,
              //  crossAxisAlignment: CrossAxisAlignment.stretch,
               children: [
                 SizedBox(
                   height: 200,
                   child: Column(
                     children: [
                        Container(child: Text('Elemento 1'), color: Colors.blue,),
                        Text('Elemento 2'),
                        Text('Elemento 3'),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('25'),
                            Text(''),
                            Text('min'),
                          ],
                        )
                     ],
                   ),
                 ),
               ],
             ),
           ),
       );
  }
}