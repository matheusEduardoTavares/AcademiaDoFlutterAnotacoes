/// Uma classe abstrata possui métodos implementados,
/// já uma interface possui apenas métodos sem 
/// corpo
abstract class CarroClasseAbstrata {
  void velocidadeMaxima() {

  }
}

/// Isso aqui é uma interface pois não tem 
/// nenhum método implementado !!!
abstract class Carro {
  abstract int portas;
  abstract int rodas;
  abstract String motor;

  int velocidadeMaxima();
}