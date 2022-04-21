import 'dart:convert';

class Curso {
  Curso({
    required this.nome,
    required this.descricao,
  });
  
  String nome;
  String descricao;  

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'descricao': descricao,
    };
  }

  factory Curso.fromMap(Map<String, dynamic> map) {
    return Curso(
      nome: map['nome'] ?? '',
      descricao: map['descricao'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Curso.fromJson(String source) => Curso.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Curso(nome: $nome, descricao: $descricao)';
  }
}
