import 'package:collection/collection.dart';
import 'package:dart_poo/25_conversoes/aluno.dart';

void main(List<String> args) {
  final frutas = [
    Fruta('banana'),
    Fruta('abacaxi'),
    Fruta('laranja'),
  ];

  final sucos = frutas.map(
    (e) => Suco(sabor: e.nome),
  ).toList();

  print(sucos);

  final frutasMap = [
    {'nome': 'banana'},
    {'nome': 'abacaxi'},
    {'nome': 'laranja'},
  ];

  final sucos2 = frutasMap.map(
    (frutaMap) => Suco(sabor: frutaMap['nome']!),
  ).toList();

  print(sucos2);

  print(ListEquality().equals(sucos, sucos2));
  print(sucos == sucos2);

  final alunosAdf = <String, Object>{
    'nome': 'Rodrigo Rahman',
    'cursos': [
      {
        'nome': 'Academia do Flutter',
        'descricao': 'Melhor curso de Flutter do Brasil!!!',
      },
      {
        'nome': 'Imersão GetX',
        'descricao': 'Imersão em GetX',
      },
      {
        'nome': 'Imersão Código Limpo',
        'descricao': 'Imersão em Código Limpo',
      },
    ],
  };

  final alunos = Aluno.fromMap(alunosAdf);
  print(alunos);
}

class Suco {
  String sabor;
  Suco({
    required this.sabor,
  });

  @override
  String toString() => 'Suco(sabor: $sabor)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Suco &&
      other.sabor == sabor;
  }

  @override
  int get hashCode => sabor.hashCode;
}

class Fruta {
  String nome;
  Fruta(this.nome);

  @override
  String toString() => 'Fruta(nome: $nome)';
}
