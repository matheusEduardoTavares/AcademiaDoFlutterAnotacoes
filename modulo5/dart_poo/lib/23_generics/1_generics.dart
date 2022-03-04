//ignore_for_file: unused_local_variable

void main(List<String> args) {
  List<int> numeros = [1, 2, 3];
  ///error
  //numeros.add('');

  Map<String, int> mapa = {
    ///error
    ///0: 1
  };

  final caixa = Caixa<Bola>();
  caixa.adicionar(Bola());
  caixa.getItems();
  print(caixa.alturaItems());
  
  final caixaBoneca = Caixa<Boneca>();
  caixaBoneca.adicionar(Boneca());
  List<Boneca> bonecas = caixaBoneca.getItems();
  print(caixaBoneca.alturaItems());

  ///error, pois o Computador não é subtipo de Item
  // final caixaComputador = Caixa<Computador>();
}

// class Caixa {
//   List<dynamic> items = [];

//   void adicionar(Bola bola) {
//     items.add(bola);
//   }

//   void adicionarBoneca(Boneca boneca) {
//     items.add(boneca);
//   }

//   List<dynamic> getItems() {
//     return items;
//   }
// }

abstract class Item {
  double altura();
}

class Caixa<I extends Item> {
  final _items = <I>[];

  void adicionar(I item) {
    _items.add(item);
  }

  List<I> getItems() => _items;

  List<double> alturaItems() {
    return _items.map((e) => e.altura()).toList();
  }
}

class Bola extends Item {
  @override
  double altura() {
    return 20.0;
  }

}
class Boneca extends Item {
  @override
  double altura() {
    return 60.0;
  }
}

class Telefone extends Item {
  @override
  double altura() {
    return 80.0;
  }
}

class Computador {}