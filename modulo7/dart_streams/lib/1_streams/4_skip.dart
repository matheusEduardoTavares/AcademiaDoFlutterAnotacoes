void main(List<String> args) async {
  print('Início');
  final interval = Duration(seconds: 2);
  var stream = Stream<int>.periodic(
    interval,
    callback,
  );

  ///O skip pula a quantidade que passarmos
  ///como parâmetro de vezes da execução da
  ///callback passada para a stream. No caso,
  ///os 2 primeiros valores serão descartados,
  ///e como temos um take de 5 para pegar só
  ///os primeiros 5 valores, no fim no await
  ///for chegará apenas os 3 últimos resultados
  ///baseados nas 3 últimas entradas da stream,
  ///já que as 2 primeiras foram descartadas
  stream = stream.
    take(5)
    .skip(2);
  await for (var i in stream) {
    print('O número que chegou no await for é $i');
  }

  print('Fim');
}

int callback(int value) {
  print('Callback valor que chegou é $value');
  return (value + 1) * 2;
}