// ignore_for_file: file_names
import 'package:dart_poo/2_construtores/pessoa.dart';

void main(List<String> args) {
  var pessoa = Pessoa(
    nome: 'Rodrigo Rahman',
    idade: 38,
    sexo: 'Masculino'
  );

  print(pessoa.nome);

  var pessoaSemNome = Pessoa.semNome(
    idade: 38,
    sexo: 'Masculino'
  );

  print(pessoaSemNome.nome);
}