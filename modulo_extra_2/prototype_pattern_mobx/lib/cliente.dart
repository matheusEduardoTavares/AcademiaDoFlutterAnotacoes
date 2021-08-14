class Cliente {
  Cliente({
    required this.idade,
    this.nome,
    this.telefone,
  });

  String? nome;
  String? telefone;
  int idade;

  ///O [Prototype Pattern] é um 
  ///pattern de criação onde torna possível 
  ///clonar objetos sem depender deles, não 
  ///precisamos conhecer o objeto como um todo,
  ///apenas pedimos um clone dele, e ele dá 
  ///o mesmo objeto mas com um [hashCode]
  ///diferente, e com o 
  ///[copyWith] além de cloná-lo conseguimos
  ///alterar algum dado
  Cliente copyWith({
    String? nome,
    String? telefone,
    int? idade,
  }) => Cliente(
    idade: idade ?? this.idade,
    telefone: telefone ?? this.telefone,
    nome: nome ?? this.nome,
  );
}
