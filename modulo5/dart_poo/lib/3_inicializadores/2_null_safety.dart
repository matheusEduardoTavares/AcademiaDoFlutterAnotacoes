// ignore_for_file: file_names

import 'package:dart_poo/3_inicializadores/cliente.dart';

/// Dá erro
// final String nome;

late final String nome;

/// Tome cuidado com o late e o ! (force non-null)
void main(List<String> args) {
  var cliente = Cliente(nome: 'Rodrigo');
  cliente.nome = 'Rodrigo';
  // cliente.nome = 'Almeida';

  print(cliente.nome);
  // print(cliente.idade!.toDouble());

  // final String nome;
  // nome = 'a';
  nome = 'Rodrigo';
  print(nome);
}