void main(List<String> args) async {
  print('Início');
  final interval = Duration(seconds: 2);
  var stream = Stream<int>.periodic(
    interval,
    callback,
  );

  ///O where descarta quem não atender 
  ///a condição, mas mesmo 
  ///quando a condição é atendida
  ///a primeira vez, o filtro segue funcionando
  ///em todas as demais vezes (e no caso do 
  ///skipWhile, ele pula todos enquanto for 
  ///true, já o where não pula, mantém o que 
  ///for true, e o where sempre executa, já o 
  ///skipWhile para de fazer a validação depois que
  ///o primeiro retornar false)
  stream = stream.where(
    (numero) => numero % 6 == 0,
  ).take(3);

  ///Só chega aqui no listen o que retornar
  ///true no where
  stream.listen((numero) {
    print('Listen value: $numero');
  });

  print('Fim');
}

int callback(int value) {
  print('Callback valor que chegou é $value');

  return (value + 1) * 2;
}