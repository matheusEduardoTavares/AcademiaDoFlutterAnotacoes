// ignore_for_file: file_names
import 'package:dart_poo/1_classes/camiseta.dart';

void main(List<String> args) {
  final camisetaNike = Camiseta();
  camisetaNike.cor = 'Preta';
  camisetaNike.tamanho = 'G';
  camisetaNike.marca = 'Nike';

  /// Print de várias linhas
  print('''
    Camiseta: 
      Tamanho: ${camisetaNike.tamanho}
      Cor: ${camisetaNike.cor}
      Marca: ${camisetaNike.marca}
      TipoLavagem: ${camisetaNike.tipoDeLavagem()}
  ''');

  print('Camiseta.nome = ${Camiseta.nome}');
  print('Camiseta.recuperarNome() = ${Camiseta.recuperarNome()}');
  // Camiseta.nome = 'Camiseta Nike';
  print('Camiseta.nome = ${Camiseta.nome}');

  final camisetaAdidas = Camiseta();
  camisetaAdidas.cor = 'Verde';
  camisetaAdidas.tamanho = 'G';
  camisetaAdidas.marca = 'Addidas';

  print('''
    Camiseta: 
      Tamanho: ${camisetaAdidas.tamanho}
      Cor: ${camisetaAdidas.cor}
      Marca: ${camisetaAdidas.marca}
      TipoLavagem: ${camisetaAdidas.tipoDeLavagem()}
  ''');

  /// String, int e outros tipos são classes,
  /// porém o dart permite funções e variáveis
  /// de nível superior
}