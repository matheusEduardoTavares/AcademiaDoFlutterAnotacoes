void main(List<String> args) async {
  print('Início');
  final interval = Duration(seconds: 2);
  var stream = Stream<int>.periodic(
    interval,
    callback,
  );

  stream = stream.take(10);

  ///Agora, ao invés de parar a aplicação 
  ///com o await for ou com o await para o 
  ///toList para esperar todos os dados virem
  ///para continuar a execução do programa,
  ///usaremos o listen que irá ficar escutando uma
  ///stream e sempre que chegar novos dados
  ///será executada, de forma a não parar a 
  ///execução do programa naquele ponto.
  ///Chamamos isso de ouvinte e é muito usado
  ///em streams
  stream.listen((numero) {
    print('Listen value: $numero');
  });

  print('Fim');
}

int callback(int value) {
  print('Callback valor que chegou é $value');

  return (value + 1) * 2;
}