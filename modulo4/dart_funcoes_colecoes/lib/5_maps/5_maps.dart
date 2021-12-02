// ignore_for_file: file_names, unused_local_variable
void main(List<String> args) {
  final paciente = <String, String>{
    'nome': 'Rodrigo Rahman',
    'curso': 'Academia do Flutter'
  };

  // ignore: avoid_init_to_null
  Map<String, String>? pacienteNullSafety = null;
  Map<String?, String> pacienteNullSafety2 = {
    null: 'Rodrigo',
  };
  Map<String, String?> pacienteNullSafety3 = {
    'nome': null,
  };
  final pacienteNullSafety4 = <String?, String?>{
    null: null,
  };

  var produtos = <String, String>{};
  produtos.putIfAbsent('nome', () => 'Cerveja');
  produtos.putIfAbsent('nome', () => 'Refrigerante');
  print(produtos);

  produtos.update('nome', (value) => 'Refrigerante');
  print(produtos);

  /// Dá erro dar update em uma key que não existe
  // produtos.update('nome2', (value) => 'Refrigerante');

  /// Agora não quebra pq se não tiver a key ela é adicionada
  /// junto do valor do ifAbsent
  produtos.update('preco', (value) => '10', ifAbsent: () => '10');
  print(produtos);

  /// Recuperando o valor
  print(produtos['nome']);

  /// Nunca usar o forEach quando tiver um processo
  /// assíncrono dentro dele
  produtos.forEach((key, value) {
    print('Chave: $key - Valor: $value');
  });

  print('For in entries');
  /// Fazer algum processo assíncrono dentro
  for(var entry in produtos.entries) {
    final key = entry.key;
    final value = entry.value;
    print('Chave: $key - Valor: $value');
  }

  print('For in keys');
  for(var key in produtos.keys) {
    final value = produtos[key];
    print('Chave: $key - Valor: $value');
  }

  print('For in values');
  for(var value in produtos.values) {
    print('Valor: $value');
  }

  final novoMapProdutos = produtos.map((key, value) {
    return MapEntry('${key}Nova', value.toUpperCase());
  });

  print('novoMapProdutos: $novoMapProdutos');

  print('\n\n');

  var mapa = <String, Object> {
    'nome': 'Rodrigo Rahman',
    'cursos': [
      {
        'nome': 'Academia do Flutter',
        'descricao': 'Melhor curso de flutter do Brasil',
      },
      {
        'nome': 'Arquiteto Flutter',
        'descricao': 'Melhor curso de flutter do Brasil',
      },
    ],
  };

  print(mapa['cursos']);
}