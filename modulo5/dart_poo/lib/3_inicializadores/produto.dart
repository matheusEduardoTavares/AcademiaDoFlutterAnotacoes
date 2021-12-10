class Produto {
  final int? _id;
  final String? nome;
  final double? _preco;

  // Produto(
  //   this.id,
  //   this.nome,
  //   this.preco,
  // );

  // Produto(
  //   int id,
  //   String nome,
  //   double preco,
  // ) {
  //   this.id = id;
  //   this.nome = nome;
  //   this.preco = preco;
  // }

  /// Dá erro
  // Produto({
  //   required int id,
  //   required String nome,
  //   required double preco,
  // }) {
  //   this._id = id;
  //   this.nome = nome;
  //   this._preco = preco;
  // }

  /// Em um construtor que não é factory, ao
  /// chegar no corpo da função a instância já
  /// foi criada e inicializada, por isso dá erro
  /// atribuir um atributo final dentro do corpo
  /// de um construtor que não é factory, e aí
  /// no caso de atributos privados, fazemos a 
  /// inicialização através dos :, podendo até
  /// mesmo por o corpo da função depois.
  Produto({
    required int id,
    this.nome,
    required double preco,
  }) :
    _id = id,
    _preco = preco {
      print('_id = $_id');
      print('_preco = $_preco');
    }

  /// O factory não aceita o this dentro dos
  /// seus parâmetros pois ele apenas retorna a 
  /// instância
  factory Produto.fabrica({
    required int id,
    required String nome,
    required double preco,
  }) {
    return Produto(
      id: id,
      preco: preco,
      nome: nome,
    );
  }
}