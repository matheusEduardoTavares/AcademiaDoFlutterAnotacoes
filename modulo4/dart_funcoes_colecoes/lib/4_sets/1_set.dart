// ignore_for_file: file_names

void main(List<String> args) {
  var numerosLista = <int?>[];
  numerosLista.add(1);
  numerosLista.add(2);
  numerosLista.add(3);
  numerosLista.add(3);
  numerosLista.add(null);
  numerosLista.add(1);
  numerosLista.add(2);
  print(numerosLista);

  // var numerosSet = Set();
  ///Sem valores duplicados
  var numerosSet = <int?>{};
  numerosSet.add(1);
  numerosSet.add(2);
  numerosSet.add(3);
  numerosSet.add(3);
  numerosSet.add(null);
  numerosSet.add(1);
  numerosSet.add(2);
  print(numerosSet);

  print('toSet');
  print(numerosLista.toSet());

  numerosSet.forEach(print);

  var numeros1 = {1, 2, 3, 4, 5, 6};
  var numeros2 = {1, 3, 4, 7};

  /// O que tem em numeros1 que não tem em 
  /// numeros2
  /// {2, 5, 6}
  print(numeros1.difference(numeros2));
  /// {7}
  print(numeros2.difference(numeros1));

  /// union
  /// {1, 2, 3, 4, 5, 6, 7}
  print(numeros1.union(numeros2));

  /// intersection
  /// {1, 3, 4}
  print(numeros1.intersection(numeros2));

  var nomes1 = { 'Rodrigo', 'Luana', 'José'};
  var nomes2 = { 'Rodrigo', 'Joaquim', 'Guilherme'};
  /// { Rodrigo }
  print(nomes1.intersection(nomes2));

  /// Busca o elemento dentro do set e retorna null
  /// se não achar
  print(numeros1.lookup(99));

  /// Rodrigo
  print(nomes1.elementAt(0));
}