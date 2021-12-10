class Cliente {
  late final String nome;
  int? idade;

  Cliente({required String nome}) {
    // this.nome = nome;
  }

  Cliente.comNome({required String nome}) {
    nome = nome;
  }
}