void main(List<String> args) async {
  print('Início');
  final interval = Duration(seconds: 2);
  var stream = Stream<int>.periodic(
    interval,
    callback,
  );

  ///O takeWhile faz a mesma coisa que o take,
  ///porém esse recebe um método de callback que
  ///faz com que pare. O resultado que dá 
  ///false já não é chamado no await for.
  stream = stream.takeWhile(
    (int numero) {
      print('O número que chegou no takeWhile é $numero');
      return numero < 10;
    },
  );
  await for (var i in stream) {
    print('O número que chegou no await for é $i');
  }

  print('Fim');
}

int callback(int value) {
  print('O valor é $value');
  return (value + 1) * 2;
}