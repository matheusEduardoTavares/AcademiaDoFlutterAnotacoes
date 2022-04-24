import 'dart:convert';

import 'package:consumo_api/models/aluno.dart';
import 'package:http/http.dart' as http;

class AlunosRepository {
  Future<List<Aluno>> findAll() async {
    final alunosResponse = await http.get(Uri.parse('http://localhost:3031/alunos'));

    final alunosList = jsonDecode(alunosResponse.body) as List;

    return alunosList.map<Aluno>((alunoMap) => Aluno.fromMap(alunoMap)).toList();
  }

  Future<Aluno> findById(String id) async {
    final response = await http.get(Uri.parse('http://localhost:3031/alunos/$id'));

    return Aluno.fromJson(response.body);
    // final alunoMap = jsonDecode(response.body) as Map<String, dynamic>;
    // return Aluno.fromMap(alunoMap);
  }

  Future<void> update(Aluno aluno) async {
    await http.put(
      Uri.parse('http://localhost:3031/alunos/${aluno.id}'),
      body: aluno.toJson(),
      headers: {
        'content-type': 'application/json'
      }
    );
  }

  Future<void> insert(Aluno aluno) async {
    await http.post(
      Uri.parse('http://localhost:3031/alunos'),
      body: aluno.toJson(),
      headers: {
        'content-type': 'application/json'
      }
    );
  }
}