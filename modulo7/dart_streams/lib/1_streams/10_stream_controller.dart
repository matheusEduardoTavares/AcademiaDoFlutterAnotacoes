import 'dart:async';

Future<void> main() async {
  print('Início Stream Controller');

  final streamController = StreamController<int>.broadcast();

  ///Porta de entrada da stream, onde 
  ///adicionamos os dados dentro da stream
  final inStream = streamController.sink;

  ///Stream
  final outStream = streamController.stream;

  outStream
    .skip(1)
    .where((numero) => numero % 2 == 0)
    .map((numero) => 'O valor par enviado é $numero')
    .listen((strConvertida) {
      print('String recebida, strConvertida = $strConvertida');
    });

  var numeros = List.
    generate(20, (index) => index);

  for (var numero in numeros) {
    print('Enviando número $numero');
    inStream.add(numero);
    // streamController.add(numero);
    await Future.delayed(Duration(milliseconds: 500));
  }

  print('Fim Stream Controller');
  await streamController.close();
}