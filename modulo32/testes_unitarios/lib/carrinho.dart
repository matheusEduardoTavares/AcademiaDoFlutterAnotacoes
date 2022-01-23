import 'package:testes_unitarios/item.dart';

class Carrinho {
  Carrinho({
    required this.items,
  });

  final List<Item> items;  

  double totalCarrinho() {
    var total = 0.0;

    for (var i = 1; i <= items.length; i++) {
      total = items[i].preco;
    }

    return total;
  }
}
