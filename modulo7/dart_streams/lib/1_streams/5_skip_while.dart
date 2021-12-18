void main(List<String> args) async {
  print('Início');
  final interval = Duration(seconds: 2);
  var stream = Stream<int>.periodic(
    interval,
    callback,
  );

  ///O skip while pula todos resultados enquanto
  ///eles retornam true, a partir do momento 
  ///que retorna false, passa a não pular mais
  ///nenhum
  stream = stream.
    take(5)
    .skipWhile((numero) {
      print('Número que chegou na skipWhile $numero');
      return numero < 5;
    });

  await for (var i in stream) {
    print('O número que chegou no await for é $i');
  }

  print('Fim');
}

int callback(int value) {
  print('Callback valor que chegou é $value');
  // if (value > 2) {
  //   return 0;
  // }

  return (value + 1) * 2;
}