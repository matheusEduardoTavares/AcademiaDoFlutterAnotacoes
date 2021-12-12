main(List<String> args) {
  print('início do p1');

  processo2();
  //2 Status (Incompleto, Concluído (Com valor, Com erro))
  processo3()
    .then((print));

  ///Se ocorrer uma exceção dentro do then,
  ///sendo que o valor que era esperado do future
  ///retornou certo, aí o erro não é catado nem
  ///pelo onError nem pelo catchError, tem que 
  ///por um try catch dentro da função passada
  ///para o then para isso
  processo4()
    .then(
      print,
      onError: (error) {
        print('Tatando o erro pelo OnError do then');
      }
    )
    .catchError((erro) => print('Erro ao executar o processo 4'));

  print('fim do p1');

  ///O whenComplete é executado quando a 
  ///Future finaliza, independente de 
  ///ser erro / sucesso, tal como o 
  ///finally no try catch
  processo3()
    .then(print)
    .whenComplete(() => print('whenComplete executado'));
}

Future<void> processo2() async {
  print('Início do p2');
  Future.delayed(Duration(seconds: 2), () {
    var i = 0;
    while (i < 3) {
      print(i);
      i++;
    }
    print('Fim do p2');
  });
}

Future<String> processo3() {
  print('Início do p3');

  return Future.delayed(Duration(seconds: 3), () {
    return 'Fim do processo P3';
  });
}

Future<String> processo4() {
  print('Início P4');
  return Future.delayed(Duration(seconds: 3), () => throw Exception());
}