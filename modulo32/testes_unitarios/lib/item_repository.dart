import 'package:testes_unitarios/item.dart';

abstract class IItemRepository {
  Future<List<Item>> buscarTodos();
  List<Item> buscarTodosSync();
  Item buscarPorId(int id);
}

class ItemRepository implements IItemRepository {
  @override
  Item buscarPorId(int id) {
    return Item(
      nome: 'Iphone',
      preco: 10000,
    );
  }

  @override
  Future<List<Item>> buscarTodos() async {
    final items = [
      Item(nome: 'Android', preco: 2000),
      Item(nome: 'Iphone 12', preco: 10000),
      Item(nome: 'Carregador de tomada', preco: 200),
    ];

    await Future.delayed(Duration(seconds: 1));
    return items;
  }

  @override
  List<Item> buscarTodosSync() {
    final items = [
      Item(nome: 'Android', preco: 2000),
      Item(nome: 'Iphone 12', preco: 10000),
      Item(nome: 'Carregador de tomada', preco: 200),
    ];

    return items;
  }

}