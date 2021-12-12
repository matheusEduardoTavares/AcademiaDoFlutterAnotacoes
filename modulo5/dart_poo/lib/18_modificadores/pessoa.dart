/// Um construtor do tipo const precisa 
/// ter todos atributos final.

class Pessoa {
  const Pessoa({
    required this.nome,
    required this.idade,
  });

  final String nome;
  final int idade;
}