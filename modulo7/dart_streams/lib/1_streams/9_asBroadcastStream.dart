void main(List<String> args) async {
  print('Início');
  final interval = Duration(seconds: 2);

  ///No dart, por padrão, toda stream pode
  ///ter apenas um único ouvinte, então se 
  ///colocarmos 2 ou mais listens para alguma
  ///stream irá dar erro. Quando queremos 
  ///de propósito que uma stream tenha mais
  ///de um ouvinte para fazer lógicas diferentes,
  ///basta atribuir o método asBroadcastStream da stream
  ///para uma variável, e tal variável será a mesma
  ///stream, mas que agora permite ter vários 
  ///listeners.
  var stream = Stream<int>.periodic(
    interval,
    callback,
  );

  // stream = stream.asBroadcastStream();
  stream = stream.take(10);

  stream.listen((numero) {
    print('Listen 1 value: $numero');
  });

  stream = stream.take(10);

  stream.listen((numero) {
    print('Listen 2 value: $numero');
  });

  ///Veremos dos listens que só printará
  ///o listen durante os 10 primeiros dados
  ///devido ao take, porém, como a stream
  ///agora é broadcast, ele não fecha a stream
  ///quando a quantidade do take já foi usada,
  ///a stream se mantém aberto e só não chamará
  ///mais as callbacks de todos listen que houverem,
  ///mas a stream se mantém aberta printando sempre
  ///"Callback valor que chegou é X". 
  ///Para fechar a stream manualmente quando
  ///quisermos temos que usar o StreamController.

  print('Fim');
}

int callback(int value) {
  print('Callback valor que chegou é $value');

  return (value + 1) * 2;
}