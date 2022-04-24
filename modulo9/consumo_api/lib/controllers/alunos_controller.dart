import 'package:consumo_api/models/aluno.dart';
import 'package:consumo_api/models/cidade.dart';
import 'package:consumo_api/models/curso.dart';
import 'package:consumo_api/models/endereco.dart';
import 'package:consumo_api/models/telefone.dart';
import 'package:consumo_api/repositories/alunos_repository.dart';

class AlunosController {
  final _alunosRepository = AlunosRepository();

  Future<void> findAll() async {
    final alunos = await _alunosRepository.findAll();

    alunos.forEach(print);
  }

  Future<void> findById(String id) async {
    final aluno = await _alunosRepository.findById(id);

    print(aluno);
  }

  Future<void> update() async {
    final aluno = await _alunosRepository.findById('1');

    aluno.nomeCursos.add('Imersão Shelf');
    _alunosRepository.update(aluno);

    final alunoAlterado = await _alunosRepository.findById('1');
    print(alunoAlterado);
  }

  Future<void> insert() async {
    final aluno = Aluno(
      nome: 'Rodrigo Almeida', 
      idade: 39,
      nomeCursos: ['Academia do Flutter'], 
      endereco: Endereco(
        rua: 'Rua X',
        numero: 200,
        cep: '3062626062',
        cidade: Cidade(
          id: 1,
          nome: 'Santo André'
        ),
        telefone: Telefone(
          ddd: 11,
          telefone: '626669252929',
        ),
      ),
      cursos: [
        Curso(
          id: 1, 
          nome: 'Academia do Flutter', 
          isAluno: true,
        ),
        Curso(
          id: 2, 
          nome: 'Imersão GetX', 
          isAluno: false,
        ),
      ],
    );

    await _alunosRepository.insert(aluno);
  }
}