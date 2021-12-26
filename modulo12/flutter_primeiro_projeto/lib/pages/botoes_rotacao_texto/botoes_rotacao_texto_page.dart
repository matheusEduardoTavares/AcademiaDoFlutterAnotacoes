import 'package:flutter/material.dart';

class BotoesRotacaoTextoPage extends StatelessWidget {

  const BotoesRotacaoTextoPage({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Botões e Rotação de Texto'),),
           body: Center(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Row(
                   children: [
                     RotatedBox(
                       quarterTurns: -1,
                       child: Container(
                         padding: EdgeInsets.all(10),
                         color: Colors.red,
                         child: Text('Rodrigo Rahman'),
                       ),
                     ),
                     Icon(Icons.ac_unit)
                   ],
                 ),
                 TextButton(
                   onPressed: () {},
                   child: Text('Salvar'),
                   style: TextButton.styleFrom(
                     primary: Colors.red,
                     padding: EdgeInsets.all(50),
                     minimumSize: Size(50, 10),
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.all(Radius.circular(60))
                     ),
                   ),
                 ),
                 IconButton(
                   onPressed: () {}, 
                   icon: Icon(Icons.exit_to_app)
                  ),
                  ElevatedButton(
                    onPressed: () {}, 
                    child: Text('Salvar'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      shadowColor: Colors.blue,
                      minimumSize: Size(120, 50),
                      shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.all(Radius.circular(60))
                     ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  ElevatedButton.icon(
                    onPressed: () {}, 
                    icon: Icon(Icons.airplane_ticket),
                    label: Text('Modo Avião'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      shadowColor: Colors.blue,
                      minimumSize: Size(120, 50),
                      shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.all(Radius.circular(60))
                     ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  ElevatedButton(
                    onPressed: () {}, 
                    child: Text('Salvar'),
                    style: ButtonStyle(
                      shadowColor: MaterialStateProperty.all(
                        Colors.blue,
                      ),
                      // minimumSize: MaterialStateProperty.all(
                      //   Size(120, 50),
                      // ),
                      minimumSize: MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Size(150, 150);
                        }
                        else if (states.contains(MaterialState.hovered)) {
                          return Size(180, 180);
                        }

                        return Size(120, 50);
                      }),
                      backgroundColor: MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.black;
                        }
                        else if (states.contains(MaterialState.hovered)) {
                          return Colors.amber;
                        }

                        return Colors.red;
                      })
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: () {},
                    child: Text('InkWeel'),
                  ),
                  GestureDetector(
                    child: Text('Gesture detector'),
                    onVerticalDragStart: (_) => debugPrint('Gesture movimentado $_'),
                    onTap: () {
                      debugPrint('Gesture Clicado');
                    },
                  ),
                  Container(
                    width: 300,
                    height: 100,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.blue,
                          Colors.green
                        ],
                      ),
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          offset: Offset(0, 5),
                          color: Colors.red
                        )
                      ],
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {
                        debugPrint('Botão clicado');
                      },
                      child: Center(
                        child: Text(
                          'Botão Salvar',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ),
                    ),
                  ),
               ],
             ),
           ),
       );
  }
}