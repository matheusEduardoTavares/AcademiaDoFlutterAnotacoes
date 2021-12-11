/// Cada um fica na mesma referência de memória
/// x0000f401 - pessoa = 'Rodrigo'
/// x0000f402 - pessoa2 = 'Rodrigo'

import './pessoa.dart';

void main(List<String> args) {
  var pessoa = Pessoa(
    nome: 'Rodrigo',
    email: 'rodrigrorahman@academiadoflutter.com',
  );
  var pessoa2 = Pessoa(
    nome: 'Rodrigo',
    email: 'rodrigrorahman@academiadoflutter.com',
  );

  print(pessoa.hashCode);
  print(pessoa2.hashCode);

  /// O == é um operator method que é a 
  /// representação do equals
  /// Sem implementar o hashCode, dará que 
  /// as 2 variáveis são diferentes porquê 
  /// apenas são dois endereços de memória 
  /// diferentes. Toda classe obrigatoriamente
  /// extende Object, que é a classe pai  
  /// de todo mundo. O hashcode das instâncias
  /// da classe são diferentes, e se o hashCode
  /// não for implementado, por padrão usa do 
  /// Object que basicamente valida a 
  /// referência de memória (hashCode da instância).
  /// Para resolver isso é só implementar o equals
  /// (mesma coisa que implementar o hashCode). Devemos
  /// fazer a implementação do equals quando nós
  /// queremos definir quando as instâncias de uma 
  /// certa classe devem ser iguais. Mas sempre
  /// que sobrescrevermos o operator method ==
  /// (equals), devemos também implementar o 
  /// getter hashCode, então devemos sobrescrever
  /// ele também, para que o endereço de memória
  /// associado tenha haver com a forma que for 
  /// montado quando as instâncias devem ser iguais.
  /// Com isso sempre que dois objetos forem iguais,
  /// ou seja, tendo implementado o hashCode, então
  /// nesse caso as 2 instâncias serão iguais
  
  pessoa.nome = 'outro';
  pessoa2.nome = 'outro';

  print(pessoa);
  print(pessoa2);

  if (pessoa == pessoa2) {
    print('É igual');
  } else {
    print('Não é igual');
  }
}