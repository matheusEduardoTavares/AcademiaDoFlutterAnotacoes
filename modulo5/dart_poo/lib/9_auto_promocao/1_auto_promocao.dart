// ignore_for_file: file_names


import 'package:dart_poo/8_interfaces/carro.dart';
import 'package:dart_poo/8_interfaces/gol.dart';
import 'package:dart_poo/8_interfaces/uno.dart';

/// Variáveis de tipo superior e atributos de
/// classe não são auto promovidas para o tipo
/// checado

void main(List<String> args) {
  String? nome;

  if (nome != null) {
    nome.toLowerCase();
  }

  Carro golCarro = Gol();

  print((golCarro as Gol).tipoDeRodas());

  /// Quando checamos se a variável é(is) de um
  /// tipo, caso ela seja o dart vai automaticamente
  /// converter esta instância para a classe do 
  /// tipo
  if (golCarro is Gol) {
    print(golCarro.tipoDeRodas());
  }

  printarDadosDoCarro(golCarro);

  final uno = Uno();
  printarDadosDoCarro(uno);
}

void printarDadosDoCarro(Carro carro) {
  print('''
    Carro:
      Tipo: ${carro.runtimeType}
      Portas: ${carro.portas}
      Rodas: ${carro.rodas}
      Motor: ${carro.motor}
      Velocidade Máxima: ${carro.velocidadeMaxima()}
      Tipo de Rodas: ${carro is Gol ? carro.tipoDeRodas() : 'Não disponível'}
  ''');
}