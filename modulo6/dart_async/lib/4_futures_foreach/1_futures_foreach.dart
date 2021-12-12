void main(List<String> args) async {
  var nomes = ['Rodrigo', 'Luana', 'Guilherme'];

  print('Início');
  ///Não funciona
  // nomes.forEach((nome) async {
  //   print(await saudacao(nome));
  // });

  ///Uma forma de resolver é usar o Future.forEach
  // await Future.forEach<String>(nomes, (nome) async {
  //   print(await saudacao(nome));
  // });

  ///Outra é com o for in
  // for (var nome in nomes) {
  //   print(await saudacao(nome));
  // }

  ///Mas de ambas formas, na verdade eles 
  ///são executados de forma sequencial devido
  ///ao await, não são executados em paralelo.
  ///Para executá-los em paralelo, devemos
  ///primeiro criar uma lista de Future, e
  ///depois usar o Future.wait, e no fim teremos
  ///uma lista com os resultados do return
  
  var nomesFuturo = 
    nomes.map((nome) => saudacao(nome)).toList();

  var saudacoes = await Future.wait(nomesFuturo);
  print(saudacoes);

  var nomesFuturosNaMao = [
    saudacao('Rodrigo'),
    saudacao('João'),
    saudacao('Teste'),
  ];

  var saudacoesNaMao = await Future.wait(nomesFuturosNaMao);
  print('saudacoesNaMao: $saudacoesNaMao');

  print('Fim');
}

Future<String> saudacao(String nome) {
  print('Início $nome');
  return Future.delayed(Duration(seconds: 1), () {
    print('Fim $nome');
    return 'Olá $nome';
  });
}

Future<void> p1() async {
  await saudacao('nome');
}

Future<String> p2 () async {
  await saudacao('');
  return Future.value('');
}