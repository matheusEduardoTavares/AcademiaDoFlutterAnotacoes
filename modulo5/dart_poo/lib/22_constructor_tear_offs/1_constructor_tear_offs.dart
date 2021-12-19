void main(List<String> args) {
  ///A partir do Dart 2.15 foi adicionado
  ///uma nova estrutura, que é o constructor
  ///tear offs.
  
  final nomes = ['Rodrigo', 'Guilherme', 'Renato', 'Sandra'];
  final pessoasAntigo = nomes.map((nome) => Pessoa(nome)).toList();
  _printPessoasName(pessoasAntigo);
  
  ///Constructor tear offs é poder passar um 
  ///construtor nomeado como se fosse uma função 
  ///sem ter que criar toda função anônima para fazer
  ///a manipulação como foi feito na linha 6
  var pessoas = nomes.map<Pessoa>(Pessoa.nome).toList();
  _printPessoasName(pessoas);

  ///Com essa estrutura de constructors 
  ///tear off, veio também um novo operador 
  ///para ser possível chamar construtores que
  ///não são nomeados (default), 
  ///que no caso é o new
  var pessoasConstrutorDefault = nomes.map<Pessoa>(Pessoa.new).toList();
  _printPessoasName(pessoasConstrutorDefault);

  funcaoQualquer(Pessoa.new);
  funcaoQualquer(printPessoa);

  ///É interessante usar esse recurso de 
  ///constructor tear offs para
  ///fazer uso do toJson e do fromJson em 
  ///consumo à API's.
  final pessoas2 = nomes.map<Pessoa>(Pessoa.fromJson).toList();
  _printPessoasName(pessoas2);
}

void _printPessoasName(List<Pessoa> pessoas) {
  for (var pessoa in pessoas) {
    print('Olá ${pessoa.nome}');
  }
  print('${pessoas.hashCode} ----------------- ${pessoas.hashCode}');
}

Pessoa printPessoa(String nome) {
  return Pessoa(nome);
}

///Existem 3 operadores que aceitam uma 
///função independente de seu retorno
///(mesmo que o tipo de retorno da função
///passada seja diferente do que a função
///retorna), que são o void, o dynamic e 
///o Object
void funcaoQualquer(Pessoa Function(String) funcao) {
  funcao('Rodrigo');
}

class Pessoa {
  String nome;

  Pessoa(this.nome);
  Pessoa.nome(this.nome);

  factory Pessoa.fromJson(String nome) {
    return Pessoa(nome);
  }
}