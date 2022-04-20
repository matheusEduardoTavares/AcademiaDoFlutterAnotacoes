import 'package:dart_poo/24_part_of/telefone.dart';

///O comando do part tem que estar após todos imports
part 'endereco.dart';
part 'cpf.dart';

class Pessoa {
  String? nome;
  _Endereco endereco = _Endereco();
  CPF cpf = CPF();
  Telefone? telefone;
}