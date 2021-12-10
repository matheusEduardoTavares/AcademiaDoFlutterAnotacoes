// ignore_for_file: file_names

import 'package:dart_poo/8_interfaces/carro.dart';
import 'package:dart_poo/8_interfaces/gol.dart';
import 'package:dart_poo/8_interfaces/uno.dart';

void main(List<String> args) {
  var uno = Uno();
  var gol = Gol();

  // print(uno.velocidadeMaxima());
  // print(gol.velocidadeMaxima());

  printarDadosDoCarro(uno);
  printarDadosDoCarro(gol);

  print(gol.tipoDeRodas());

  ///Mesmo que a instância seja de Gol, por 
  ///declarar o tipo Carro, só temos acesso ao
  ///que é do Carro, portanto não acessamos aqui
  ///o tipo de rodas
  // ignore: unused_local_variable
  Carro golCarro = Gol();
}

void printarDadosDoCarro(Carro carro) {
  print('''
    Carro:
      Tipo: ${carro.runtimeType}
      Portas: ${carro.portas}
      Rodas: ${carro.rodas}
      Motor: ${carro.motor}
      Velocidade Máxima: ${carro.velocidadeMaxima()}
  ''');
}