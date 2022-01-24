import 'package:testes_unitarios/item.dart';

class Carrinho {
  Carrinho({
    required this.items,
  });

  final List<Item> items;  

  double totalCarrinho() {
    // var total = 0.0;

    // for (var i = 0; i < items.length; i++) {
    //   total += items[i].preco;
    // }

    // return total;

    return items.fold(
      0, 
      (totalValue, item) => totalValue + item.preco
    );
  }

  double totalCarrinhoComImposto() {
    var valorTotal = totalCarrinho();
    var imposto = 0.10;

    if (valorTotal < 5000) {
      return valorTotal;
    }
    else if (valorTotal > 20000) {
      imposto = 0.20;
    }

    valorTotal += (valorTotal * imposto);
    return valorTotal;
  }
}
