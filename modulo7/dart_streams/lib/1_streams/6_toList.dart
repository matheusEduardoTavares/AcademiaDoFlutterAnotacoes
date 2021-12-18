void main(List<String> args) async {
  print('Início');
  final interval = Duration(seconds: 2);
  var stream = Stream<int>.periodic(
    interval,
    callback,
  );

  stream = stream.
    take(5);

  /// Com isso não usamos mais o await for,
  /// recebemos todos os dados de uma vez só,
  /// ou seja, só irá parar no await do toList
  /// quando a stream for fechada
  final data = await stream.toList();
  print(data); ///[2, 4, 6, 8, 10]

  print('Fim');
}

int callback(int value) {
  print('Callback valor que chegou é $value');

  return (value + 1) * 2;
}