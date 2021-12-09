class Pessoa {
  String? nome;
  int? idade;
  String? sexo;

  ///Construtor default (todas classes tem automaticamente)
  // Pessoa();

  // Pessoa({
  //   required String nome, 
  //   required int idade,
  //   required String sexo,
  // }) {
  //     this.nome = nome;
  //     this.idade = idade;
  //     this.sexo = sexo;
  //   }
  Pessoa({
    required this.nome, 
    required this.idade,
    required this.sexo,
  });

  /// Construtores nomeados
  Pessoa.semNome({
    required this.idade,
    required this.sexo,
  });

  Pessoa.vazia();

  /// Construtor do tipo factory, é usado quando
  /// precisamos fazer alguma regra de negócio
  /// antes de criar a instância da classe em si,
  /// a instância da classe só passa a existir quando
  /// o return for efetuado, diferente dos outros
  /// construtores em que a classe já existe na
  /// memória quando seus dados são preenchidos
  factory Pessoa.fabrica(String nomeConstrutor) {
    var nome = nomeConstrutor + '_Fabrica';
    var pessoa = Pessoa.vazia();
    pessoa.nome = nome;
    return pessoa;
  }
}