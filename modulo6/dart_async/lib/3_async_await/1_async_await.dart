Future<void> main(List<String> args) async {
  ///Callback hell
  // processo1().then((mensagem) {
  //   processo2()
  //     .then((mensagem) => print('Mensagem é $mensagem'))
  //     .catchError((error) => print(error));
  //   print('Mensagem é $mensagem');
  // });

  print('início do main');


  var mensagem = await processo1();
  print(mensagem);

  var mensagem2 = await processo2();
  print(mensagem2);

  try {
    await processo3();
  }
  catch(erro) {
    print('Erro na chamada do processo 3 $erro');
  }

  print('fim do main');
}

Future<String> processo1() {
  print('Início P1');
  return Future.delayed(Duration(seconds: 1), () => 'Fim do processo P1');
}

Future<String> processo2() {
  print('Início P2');
  return Future.delayed(Duration(seconds: 1), () => 'Fim do processo P2');
}

Future<String> processo3() {
  print('Início P3');
  return Future.delayed(Duration(seconds: 1), () => throw Exception());
}