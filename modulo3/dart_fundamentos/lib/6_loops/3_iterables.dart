void main(List<String> args) {
  var numeros = List.generate(10, (index) => index);

  // for (var i = 0; i < numeros.length; i++) {
  //   if (i == 5) {
  //     continue;
  //   }

  //   print(numeros[i]);
  // }

  /// O forEach só deve ser usado se não formos fazer nenhuma ação 
  /// assíncrona
  numeros
    .where((numero) => numero != 5)
    .forEach((numero) => print(numero));

  /// Faça até que, para cada iteração, enquanto der true vai mantendo
  /// na lista os elementos que já passaram, a partir do primeiro que
  /// falha para a iteração retornando o iterable com todos elementos
  /// que deu true
  final numerosAte5 = numeros
    .takeWhile((numero) => numero < 6)
    .where((numero) => numero != 5);
  /// (0, 1, 2, 3, 4), agora é um Iterable e não um List
  print(numerosAte5);
  /// 1
  print(numerosAte5.elementAt(1));

  final numerosAte5EmLista = numerosAte5.toList();
  /// [0, 1, 2, 3, 4]
  print(numerosAte5EmLista[1]);
  /// 1
  print(numerosAte5EmLista);

  /// Pule enquanto, quando der true na condição mantém quem restou
  final numerosRemoverAte5 = numeros
    .skipWhile((numero) => numero < 6)
    .toList();
  /// [6, 7, 8, 9]
  print(numerosRemoverAte5);

  final nomes = ['Rodrigo', 'Guilherme', 'Arthur', 'Sandra', 'Marcos'];
  var nomesSkip = nomes.skipWhile((nome) {
    if (nome != 'Arthur') {
      return true;
    }

    return false;
  }).toList();
  print(nomesSkip);

  var numeroStrList = numeros.map((numero) {
    return 'Numero é $numero';
  }).toList();

  /// [Numero é 0, Numero é 1, Numero é 2, Numero é 3, Numero é 4, Numero é 5, Numero é 6, Numero é 7, Numero é 8, Numero é 9]
  print(numeroStrList);

  var numeroList = numeros.map((numero) {
    return numero + 10;
  }).toList();

  /// [10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
  print(numeroList);

  final numerosInvertidos = numeros.reversed;
  /// (9, 8, 7, 6, 5, 4, 3, 2, 1, 0)
  print(numerosInvertidos);
}