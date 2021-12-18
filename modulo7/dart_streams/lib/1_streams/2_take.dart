void main(List<String> args) async {
  print('Início');
  final interval = Duration(seconds: 2);
  var stream = Stream<int>.periodic(
    interval,
    callback,
  );

  ///O take serve para transformar a stream
  ///Vai receber somente 5 requisições, e 
  ///depois das 5 requisições, vai parar a
  ///stream
  stream = stream.take(5);

  await for (var i in stream) {
    print(i);
  }

  print('Fim');
}

int callback(int value) {
  print('O valor é $value');
  return (value + 1) * 2;
}