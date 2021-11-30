void main() {
  final numeros = [1, 2, 3, 4];
  print(numeros);

  numeros.add(1);
  print(numeros);

  ///               0         1        2          3
  final nomes = ['Rodrigo', 'João', 'Maria', 'Guilherme'];
  print(nomes);
  ///          4
  nomes.add('Luana');
  print(nomes);
  print(nomes[2]);

  nomes.addAll(['Rodrigo 2', 'Luana 2', 'Maria 2']);
  print(nomes);

  print('Adicionando José a lista');
  nomes.insert(0, 'José');
  nomes.insert(3, 'José 3');
  print(nomes);
  print(nomes[0]);
  // nomes.insertAll(index, iterable)

  /// Valida se é igual pelo equals
  nomes.remove('José 3');
  print(nomes);

  nomes.add('Rodrigo');
  print(nomes);
  nomes.removeWhere((nome) => nome == 'Rodrigo');
  print(nomes);

  print(nomes[0]);
  print(nomes.first);
  print('------');
  print(nomes.length);
  print('------');
  print(nomes[nomes.length - 1]);
  print(nomes.last);
  // print(nomes[8]); - dá erro

  print('------');
  /// Percorre a lista do elemento 0 até o último se precisar, mas ao
  /// encontrar o primeiro elemento que retorna true, é retornado tal
  /// elemento e a iteração para
  var primeiroNome = nomes.firstWhere((nome) => nome == 'Maria');
  print(primeiroNome);

  print('------');
  final numerosGerados = List.generate(10, (index) => index + 1);
  /// [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  print(numerosGerados);

  print('------');
  final stringsGerados = List.generate(10, (index) => '#${index + 1}');
  /// [#1, #2, #3, #4, #5, #6, #7, #8, #9, #10]
  print(stringsGerados);

  print('------');
  final repeticoes = List.filled(10, 'Rodrigo');
  /// [Rodrigo, Rodrigo, Rodrigo, Rodrigo, Rodrigo, Rodrigo, Rodrigo, Rodrigo, Rodrigo, Rodrigo]
  print(repeticoes);

  print('------');
  final numerosGeradosParaCalculo = List.generate(100, (index) => index + 1);
  /// Reduce
  final soma = numerosGeradosParaCalculo.
    fold<int>(0, (total, currentValue) => total + currentValue);
  /// 5050
  print(soma);

  /// Spread operator (...)
  var listaNumerosSpread = [1, 2, 3];
  var listaNumerosSpreadB = [...listaNumerosSpread, 4, 5, 6];
  /// [1, 2, 3, 4, 5, 6]
  print(listaNumerosSpreadB);

  /// Collection if
  var promocaoAtiva = true;

  var produtos = [
    'Cerveja',
    'Refrigerante',
    if (promocaoAtiva)
      'Suco de laranja',
  ];

  /// [Cerveja, Refrigerante, Suco de laranja]
  print(produtos);

  /// Collection For
  var listaInts = [1, 2, 3];
  var listaStrings = [
    '#0',
    for (var i in listaInts)
      '#$i'
  ];

  /// [#0, #1, #2, #3]
  print(listaStrings);

  var string = listaStrings.join('->');
  /// #0->#1->#2->#3
  print(string);
}