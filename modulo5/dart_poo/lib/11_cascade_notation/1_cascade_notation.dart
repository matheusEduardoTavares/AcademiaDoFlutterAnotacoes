// ignore_for_file: file_names
void main(List<String> args) {
  // var pessoa = Pessoa();
  // pessoa.nome = 'Rodrigo Rahman';
  // pessoa.email = 'rodrigorahman@academiadoflutter.com.br';
  // pessoa.site = 'academiadoflutter.com.br';

  Pessoa()
    ..nome = 'Rodrigo Rahman'
    ..email = 'rodrigorahman@academiadoflutter.com.br'
    ..site = 'academiadoflutter.com.br'
    ..printPessoa();

  var mapa = <String, String> {}
    ..addEntries([
      MapEntry('sobrenome', 'Rahman'),
    ])
    ..putIfAbsent('nome', () => 'Rodrigo')
    ..putIfAbsent('email', () => 'null')
    ..putIfAbsent('site', () => '');

  print('mapa = $mapa');
}

class Pessoa {
  String? nome;
  String? email;
  String? site;

  void printPessoa() {
    print('''
    Pessoa:
      Nome: $nome
      Email: $email
      Site: $site
  ''');
  }
}