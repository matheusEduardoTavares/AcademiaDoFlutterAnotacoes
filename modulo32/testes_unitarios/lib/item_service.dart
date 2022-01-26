import 'package:testes_unitarios/item.dart';
import 'package:testes_unitarios/item_repository.dart';

class ItemService {
  IItemRepository repository;

  ItemService({
    required this.repository,
  });

  Future<List<Item>> buscarTodos() => repository.buscarTodos();
  List<Item> buscarTodosSync() => repository.buscarTodosSync();
  Item buscarPorId(int id) => repository.buscarPorId(id);
  // Item buscarPorId(int id) {
  //   return Item(nome: 'Item X', preco: 10.0);
  // }
}