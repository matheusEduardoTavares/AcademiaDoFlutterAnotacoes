import 'dart:io';

import 'package:dart_poo/20_metadatas/fazer.dart';

@Fazer(
  quem: 'Rodrigo Rahman na classe', 
  oque: 'tentando ler a anotação da classe'
)
@gzip
class Pessoa {
  @Fazer(
    quem: 'Rodrigo Rahman no atributo', 
    oque: 'tentando ler a anotação do atributo'
  )
  String? nome;

  @Fazer(
    quem: 'Rodrigo Rahman no método', 
    oque: 'tentando ler a anotação do método'
  )
  void fazerAlgo() {

  }
}