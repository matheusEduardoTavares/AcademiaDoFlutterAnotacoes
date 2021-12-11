// ignore_for_file: file_names

import 'package:dart_poo/13_operator_methods/numeros.dart';

void main(List<String> args) {
  ///Em outras linguagens o operador é tratado
  ///exatamente como operador. No dart, por 
  ///exemplo, o + é um operator method de int.
  ///No dart tudo é O.O, inclusive o +, -, e etc
  ///são métodos dentro de suas respectivas classes
  1 + 1;

  ///Operators method:
  ///+ - == []
  
  var num1 = Numero(10);
  var num2 = Numero(20);
  final totalSoma = num1 + num2;
  print(totalSoma.i);

  var totalSub = num1 - num2;
  print('totalSub = ${totalSub.i}');

  print(num1 | num2);

  /// A principal diferença é que não invocamos
  /// os operators method com a notação de ponto
  /// como um método normal, eles são usados como
  /// operadores. Só podemos usar caracteres especiais
  /// como operators method, alguns deles.
}