import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:testes_unitarios/item.dart';
import 'package:testes_unitarios/item_repository.dart';
import 'package:testes_unitarios/item_service.dart';

// !NÃO FAZER DESSA FORMA
// class ItemRepositoryFake implements IItemRepository {
//   @override
//   Item buscarPorId(int id) {
//     return Item(nome: 'Item teste', preco: 10);
//   }

//   @override
//   Future<List<Item>> buscarTodos() async {
//     return <Item>[];
//   }

//   @override
//   List<Item> buscarTodosSync() {
//     return <Item>[];
//   }
// }

// class ItemRepositoryFakeExceptions implements IItemRepository {
//   @override
//   Item buscarPorId(int id) {
//     return Item(nome: 'Item teste', preco: 10);
//   }

//   @override
//   Future<List<Item>> buscarTodos() async {
//     throw Exception();
//   }

//   @override
//   List<Item> buscarTodosSync() {
//     return <Item>[];
//   }
// }

class ItemRepositoryFake extends Mock implements IItemRepository {

}

void main() {
  late IItemRepository itemRepository;

  setUp(() {
    ///Preparação
    itemRepository = ItemRepositoryFake();
  });

  test('Buscar todos os itens', () async {
    when(() => itemRepository.buscarTodos()).thenAnswer((_) async => <Item>[]);
    var service = ItemService(
      repository: itemRepository,
    );

    var items = await service.buscarTodos();

    expect(items, <Item>[]);
  });

  test('Buscar todos os itens retorna uma exception', () async {
    when(() => itemRepository.buscarTodos()).thenThrow(Exception());
    var service = ItemService(
      repository: itemRepository,
    );

    var call = service.buscarTodos;

    expect(
      () => call(), 
      throwsException,
    );
  });

  test('Busca por ID', () {
    var service = ItemService(
      repository: itemRepository,
    );

    // when(
    //   () => itemRepository.buscarPorId(1)
    // ).thenReturn(Item(nome: 'Item X', preco: 10.0));
    // when(
    //   () => itemRepository.buscarPorId(2)
    // ).thenReturn(Item(nome: 'Item X', preco: 10.0));
    
    when(
      () => itemRepository.buscarPorId(any())
    ).thenReturn(Item(nome: 'Item X', preco: 10.0));

    // var item = service.buscarPorId(1);
    // var item = service.buscarPorId(2);
    var item = service.buscarPorId(99);

    verify(() => itemRepository.buscarPorId(any())).called(1);
    expect(
      item, 
      isNotNull,
    );
  });

  test('Busca por ID any', () {
    var service = ItemService(
      repository: itemRepository,
    );
    
    when(
      () => itemRepository.buscarPorId(any())
    ).thenReturn(Item(nome: 'Item X', preco: 10.0));

    ///Como não usamos o any aqui, irá dar erro caso a 
    ///chamada da função passe um argumento diferente, no 
    ///caso no verify é esperado que a função buscarPorId 
    ///do repository seja chamada passando o parâmetro 1,
    ///mas se passar outro parâmetro irá dar falha no 
    ///teste
    var item = service.buscarPorId(1);
    verify(() => itemRepository.buscarPorId(1)).called(1);
    expect(
      item, 
      isNotNull,
    );
  });
}