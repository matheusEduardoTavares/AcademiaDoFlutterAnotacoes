import 'dart:convert';

void main(List<String> arguments) {
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
}
