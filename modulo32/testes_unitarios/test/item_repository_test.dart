import 'package:test/test.dart';
import 'package:testes_unitarios/item.dart';
import 'package:testes_unitarios/item_repository.dart';

void main() {
  test('Buscar todos assíncrono forma 1', () async {
    ///Preparação
    final repository = ItemRepository();
    
    ///Ação/Execução. Se der alguma exception aqui para tratar precisa
    ///por um try catch se não falhará
    var items = await repository.buscarTodos();

    ///Verificação
    expect(items, isNotEmpty);
  });

  test('Buscar todos assíncrono forma 2', () {
    ///Preparação
    final repository = ItemRepository();
    
    ///Ação/Execução
    var buscarTodos = repository.buscarTodos;

    ///Verificação
    expect(
      buscarTodos(), 
      completion(isNotEmpty)
    );
  });

  test('Buscar item por ID', () {
    ///Preparação
    final repository = ItemRepository();
    
    ///Ação/Execução
    var item = repository.buscarPorId(1);

    ///Verificação
    expect(
      item, 
      Item(
        nome: 'Iphone',
        preco: 10000,
      ),
    );

    expect(
      item, 
      isNotNull,
    );

    expect(
      item, 
      allOf(
        isNotNull,
        equals(
          Item(
            nome: 'Iphone',
            preco: 10000,
          ),
        ),
      ),
    );
  });
}