import 'package:flutter/material.dart';

class ColorsPage extends StatelessWidget {
  const ColorsPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final cor = Colors.blue;
    // final cor = Colors.red.withOpacity(0.5);
    // final cor = Color.fromRGBO(0, 0, 255, 1);

    ///Em hexadecimal é só usar o construtor
    ///do Color, colocar o 0xFF no início e o 
    ///resto é só por os 6 elementos do hexadecimal
    final cor = Color(0xFF175990);

    return Scaffold(
      appBar: AppBar(title: Text('Colors Page'),),
      body: Center(
        child: Container(
          height: 400,
          width: 400,
          color: cor,
        ),
      ),
    );
  }
}