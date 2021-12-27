import 'package:flutter/material.dart';

class StackPage2 extends StatelessWidget {
  const StackPage2({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack2'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://www.daninoce.com.br/wp-content/uploads/2017/11/o-que-voce-precisa-saber-antes-de-ir-a-nova-york-dani-noce-imagem-destaque-960x625.jpg',
                ),
              ),
            ),
          ),
          Container(
            color: Colors.white38,
          ),
          Positioned(
            bottom: 48,
            left: 10,
            right: 10,
            child: Card(
              color: Colors.white24,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)
              ),
              elevation: 12,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text('New York', style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('A cidade de Nova York compreende 5 distritos situados no encontro do rio Hudson com o Oceano Atlântico. No centro da cidade fica Manhattan, um distrito com alta densidade demográfica que está entre os principais centros comerciais, financeiros e culturais do mundo. Entre seus pontos emblemáticos, destacam-se arranha-céus, como o Empire State Building, e o enorme Central Park. O teatro da Broadway fica em meio às luzes de neon da Times Square.', style: TextStyle(color: Colors.white),),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}