import 'package:prototype_pattern/models/telefone.dart';
import 'package:prototype_pattern/prototype_interface/prototype_interface.dart';

class Pessoa implements PrototypeInterface<Pessoa>{
  Pessoa._();

  factory Pessoa() {
    final newPeople = Pessoa._();
    newPeople.nome = 'Rodrigo';
    newPeople._cpf = '212121121226';
    newPeople.telefones = [
      Telefone(telefone: '(11)-326626262'),
      Telefone(telefone: '(12)-326626262')
    ];

    return newPeople;
  }

  String? _cpf;
  String? nome;
  List<Telefone>? telefones;

  @override
  String toString() => 'Pessoa(_cpf: $_cpf, nome: $nome, telefones: $telefones)';

  @override
  Pessoa clone() {
    final newPeople = Pessoa._();
    newPeople._cpf = _cpf;
    newPeople.nome = nome;
    ///Aqui é preciso mudar o endereço de memória para caso altere em uma lista,
    ///não influencie na outra
    newPeople.telefones = [
      ...telefones ?? [],
    ];
    return newPeople;
  }
}
