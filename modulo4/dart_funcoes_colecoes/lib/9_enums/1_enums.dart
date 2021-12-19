// ignore_for_file: file_names

void main(List<String> args) {
  var cor = Cores.vermelho;

  if (cor == Cores.vermelho) {

  }

  print(Cores.azul); // Cores.azul

  var azul = 'azul';
  ///Transformando a string azul em um enum Cores.azul
  var corAzul = Cores.values.
    where((cor) => cor.toString() == 'Cores.$azul').toList();
  print(corAzul);

  ///Na versão 2.15+ do Dart foi trazido novas 
  ///funcionalidades para facilitar o uso
  ///de enums. Para poder usar essa versão
  ///do Dart, a versão do Flutter deve ser 
  ///2.8.0+.
  print(Cores.azul.name); //azul
  
  ///Transformando a string azul em um enum Cores.azul
  var corAzul215 = Cores.values.byName(azul);
  print(corAzul215); //Cores.azul

  ///Esse asMap tinha antes da 2.15 também
  var coresMap = Cores.values.asMap();
  print(coresMap); //{0: Cores.vermelho, 1: Cores.azul, 2: Cores.laranja, 3: Cores.verde, 4: Cores.preto}

  ///Esse asNameMap é da 2.15+
  var coresNameMap = Cores.values.asNameMap();
  print(coresNameMap); //{vermelho: Cores.vermelho, azul: Cores.azul, laranja: Cores.laranja, verde: Cores.verde, preto: Cores.preto}

  var corAzulPeloMap = coresNameMap[azul];
  print(corAzulPeloMap); //Cores.azul

  ///Se o byName não encontrar nada, é 
  ///disparado uma exceção na aplicação
  // Cores.values.byName('branco');

  ///Agora, buscando um enum a partir de 
  ///um map, se não for encontrado simplesmente
  ///a variável ficará null
  var corBranco = coresNameMap['branco'];
  print(corBranco); //null
  
  // switch(cor) {
  //   case Cores.vermelho:
  //     break;
  //   case Cores.azul:
  //     break;
  //   case Cores.laranja:
  //     break;
  //   case Cores.verde:
  //     break;
  //   case Cores.preto:
  //     break;
  // }
}

enum Cores {
  vermelho,
  azul,
  laranja,
  verde,
  preto,
}
