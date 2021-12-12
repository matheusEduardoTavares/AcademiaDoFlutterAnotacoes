void main(List<String> args) {
  var pessoa = Pessoa();
  print(pessoa.nome);
  pessoa.nome = 'Rodrigo Rahman';
  print(pessoa.nome);
}

class Pessoa {
  String? _nome;

  String? get nome => _nome;
  set nome(String? nome) {
    if (nome != null && nome.length > 3) {
      _nome = nome;
    }
  }
}