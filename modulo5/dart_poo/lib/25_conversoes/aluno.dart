
import 'dart:convert';

import 'package:dart_poo/25_conversoes/curso.dart';

class Aluno {
  String nome;
  List<Curso> cursos;
  Aluno({
    required this.nome,
    required this.cursos,
  });

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'cursos': cursos.map((x) => x.toMap()).toList(),
    };
  }

  factory Aluno.fromMap(Map<String, dynamic> map) {
    return Aluno(
      nome: map['nome'] ?? '',
      cursos: List<Curso>.from(map['cursos']?.map((x) => Curso.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Aluno.fromJson(String source) => Aluno.fromMap(json.decode(source));

  @override
  String toString() => 'Aluno(nome: $nome, cursos: $cursos)';
}
