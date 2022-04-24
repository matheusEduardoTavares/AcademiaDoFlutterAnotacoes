import 'dart:convert';

import 'package:consumo_api/controllers/filmes_controller.dart';
import 'package:consumo_api/models/telefone.dart';

void main(List<String> args) {
  // final alunoController = AlunosController();
  // alunoController.findAll();
  // alunoController.findById('2');
  // alunoController.update();
  // alunoController.insert();
  // alunoController.findById('4999a500-c3ac-11ec-8b29-1f05ad36f067');

  final filmeController = FilmesController();
  filmeController.findAll();
}

void main2(List<String> arguments) {
  final cidadeJson = '''
    [
      {
        "id": 1,
        "nome": "Santo André",
        "regiao": {
          "nome": "ABC Paulista"
        }
      },
      {
        "id": 2,
        "nome": "São Paulo",
        "regiao": {
          "nome": "ABC Paulista"
        }
      }
    ]
  ''';

  // [] -> List
  // {} -> Map<String, dynamic>
  final cidadeMap = jsonDecode(cidadeJson);

  if (cidadeMap is List) {
    print('Uma lista');
    // ignore: avoid_function_literals_in_foreach_calls
    cidadeMap.forEach((city) {
      print('nome: ${city['nome']} | Região: ${city['regiao']['nome']}');
    });
  }
  else if (cidadeMap is Map) {
    print('Um map');
    print(cidadeMap['nome']);
  }

  print(cidadeMap);
  print(cidadeMap.runtimeType);

  final cidadeMapJson = <String, dynamic>{
    'id': 123,
    'nome': 'Santo André',
    'uf': 'SP'
  };

  print(jsonEncode([cidadeMapJson]));

  final telefoneJson = '''
    {
      "ddd": 11,
      "telefone": "1216534694"
    }
  ''';

  final telefone = Telefone.fromJson(telefoneJson);
  print(telefone.ddd);
  print(telefone.telefone);
  print(telefone.toJson());
  print(telefone.toMap());
}
