import 'package:test/test.dart';
import 'package:testes_unitarios/carrinho.dart';
import 'package:testes_unitarios/item.dart';


///Testes são divididos em 3 partes:
///1. Preparação / Mock dos dados para poder fazer o teste
///2. Ação / Execução, é a execução daquilo que queremos testar
///3. Verificação / Validar se o teste está certo igual o esperado. Ela
///pode ser feita por meio de ifs, asserts, mas o ideal é com expected
void main() {
  group('Testes de cálculo de valor total do carrinho', () {
    test('Deve calcular o valor total do carrinho', () {
      ///1. Preparação
      final items = [
        Item(nome: 'Galaxy J1', preco: 2000),
        Item(nome: 'Iphone 12', preco: 10000),
        Item(nome: 'Carregador de tomada', preco: 200),
      ];

      final carrinho = Carrinho(items: items);

      ///2. Ação
      final valorTotalDoCarrinho = carrinho.totalCarrinho();

      ///3. Verificação
      ///Com expected
      expect(valorTotalDoCarrinho, 12200);
      
      ///Com if
      // if (valorTotalDoCarrinho == 12200) {
      //   throw Exception('O esperado era 12200');
      // }

      ///Com assert
      // assert(valorTotalDoCarrinho == 12200);
    });
    
    test('Deve calcular o valor total do carrinho para carrinho vazio', () {
      ///1. Preparação
      final items = <Item>[];

      final carrinho = Carrinho(items: items);

      ///2. Ação
      final valorTotalDoCarrinho = carrinho.totalCarrinho();

      ///3. Verificação
      ///Com expected
      expect(valorTotalDoCarrinho, 0);
    });
  });

  group('Teste de cálculo de valor total de carrinho com imposto', () {
    test('Deve calcular o valor total do carrinho com imposto de 10%', () {
      final items = [
        Item(nome: 'Galaxy J1', preco: 2000),
        Item(nome: 'Iphone 12', preco: 10000),
        Item(nome: 'Carregador de tomada', preco: 200),
      ];

      final carrinho = Carrinho(items: items);
      final valorTotalComImposto = carrinho.totalCarrinhoComImposto();

      expect(valorTotalComImposto, 13420);
    });

    ///Se o valor for menor que 5000 não cobra imposto.
      test('Deve retornar o valor sem imposto caso seja menor que 5000', () {
        final items = [
          Item(nome: 'Galaxy J1', preco: 2000),
          Item(nome: 'Fone de ouvido', preco: 2900),
        ];

        final carrinho = Carrinho(items: items);
        final valorTotal = carrinho.totalCarrinhoComImposto();

        expect(valorTotal, 4900);
      });

      ///Se o valor for igual a 5000 deve cobrar imposto
      test('Deve retornar o valor com imposto de 10% caso seja igual a 5000', () {
        final items = [
          Item(nome: 'Galaxy J1', preco: 2000),
          Item(nome: 'Fone de ouvido', preco: 3000),
        ];

        final carrinho = Carrinho(items: items);
        final valorTotal = carrinho.totalCarrinhoComImposto();

        expect(valorTotal, 5500);
      });

      ///Se o valor for maior que 20000 deve cobrar imposto de 20%
      test('Deve retornar o valor com 20% de imposto para o carrinho com valor maior que 20000', () {
        final items = [
          Item(nome: 'Galaxy J1', preco: 2000),
          Item(nome: 'Iphone', preco: 10000),
          Item(nome: 'Iphone', preco: 10000),
        ];

        final carrinho = Carrinho(items: items);
        final valorTotal = carrinho.totalCarrinhoComImposto();

        expect(valorTotal, 26400);
      });

      test('Deve retornar o valor com 10% de imposto para o carrinho com valor igual a 20000', () {
        final items = [
          Item(nome: 'Iphone', preco: 10000),
          Item(nome: 'Iphone', preco: 10000),
        ];

        final carrinho = Carrinho(items: items);
        final valorTotal = carrinho.totalCarrinhoComImposto();

        expect(valorTotal, 22000);
      });
  });

  group('Teste de igualdade', () {
    test('Teste de igualdade', () {
      final iphone = Item(nome: 'Iphone 12', preco: 10000);
      final items = [
        Item(nome: 'Galaxy J1', preco: 2000),
        iphone,
        Item(nome: 'Carregador de tomada', preco: 200),
      ];

      final carrinho = Carrinho(items: items);

      expect(carrinho.items, contains(
        iphone,
      ));
    });
  });

  group('Teste de igualdade 2', () {
    test('Teste de igualdade', () {
      final items = [
        Item(nome: 'Galaxy J1', preco: 2000),
        Item(nome: 'Iphone 12', preco: 10000),
        Item(nome: 'Carregador de tomada', preco: 200),
      ];

      final carrinho = Carrinho(items: items);

      expect(carrinho.items, contains(
        Item(nome: 'Iphone 12', preco: 10000),
      ));
    });
  });

  group('Teste de igualdade por quantidade e por tipo', () {
    test('Teste de igualdade', () {
      final items = [
        Item(nome: 'Galaxy J1', preco: 2000),
        Item(nome: 'Iphone 12', preco: 10000),
        Item(nome: 'Carregador de tomada', preco: 200),
      ];

      final carrinho = Carrinho(items: items);

      expect(carrinho.items.length, 3);
      expect(
        carrinho.items,
        isA<List<Item>>(),
      );
    });

    test('Teste de Exceptions', () {
      final items = <Item>[];

      final carrinho = Carrinho(items: items);
      var call = carrinho.totalCarrinho;

      expect(
        () => call(),
        throwsException,
      );
      expect(
        () => call(),
        throwsFormatException,
      );
    });

    test('Teste de Exceptions customizadas', () {
      final items = <Item>[];

      final carrinho = Carrinho(items: items);
      var call = carrinho.totalCarrinho;

      expect(
        () => call(),
        throwsA(isA<CarrinhoException>()),
      );
    });

    test('Teste de Exceptions customizadas 2', () {
      final items = <Item>[];

      final carrinho = Carrinho(items: items);
      try {
        carrinho.totalCarrinho();
      }
      on CarrinhoException {
        print('Sucesso');
      } catch(e) {
        fail('Retornou outra exception ($e)');
      }
    });
  });
}