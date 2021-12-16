void main(List<String> args) async {
  print('Início');
  final interval = Duration(seconds: 2);
  final stream = Stream<int>.periodic(
    interval,
    callback,
  );

  ///Vai ficar parado aqui, e quando a stream
  ///receber algum valor ele para e executa 
  ///novamente.
  await for (var i in stream) {
    print(i);
  }

  ///Se não parar a stream, nunca chega aqui,
  ///pois o await for fica esperando eternamente
  ///novos dados da stream, mas diferente de 
  ///um loop infinito que fica gastando 
  ///recursos eternamente, só é executado o 
  ///dado do for quando chegar da stream o 
  ///novo valor, então só gasta recurso na 
  ///hora de processar o que chegou
  print('Fim');
}

int callback(int value) {
  print('O valor é $value');
  return (value + 1) * 2;
}