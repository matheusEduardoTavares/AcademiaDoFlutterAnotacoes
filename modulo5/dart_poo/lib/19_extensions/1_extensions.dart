import './saudacao_string_extension.dart';
import './pessoa.dart';
import './pessoa_saudacao_extension.dart';

void main(List<String> args) {
  var nome = 'Rodrigo Rahman';
  print(nome.saudacao());

  var p1 = Pessoa(nome: 'Rodrigo');
  print(p1.saudacao());
}