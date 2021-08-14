import 'package:mobx/mobx.dart';
import 'package:prototype_pattern_mobx/cliente.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  @observable 
  Cliente? cliente;

  @action 
  void loadCliente() {
    cliente = Cliente(
      nome: 'Rodrigo',
      telefone: '123123213',
      idade: 36,
    );
  }

  @action
  void fazerAniversario() {
    final cli = cliente as Cliente;
    cliente = cli.copyWith(
      idade: cli.idade + 1,
    );
  }
}