import './pessoa.dart';

void main(List<String> args) {
  ///Não funciona pois variáveis são definidas
  ///em tempo de execução
  // var nome = 'Rodrigo';

  const nome = 'Rodrigo';

  var p1 = const Pessoa(
    nome: nome, 
    idade: 37
  );

  var p2 = const Pessoa(
    nome: 'Rodrigo', 
    idade: 37
  );

  var p3 = const Pessoa(
    nome: 'Rodrigo', 
    idade: 37
  );

  ///Mesmo sem implementar o equals, só dos dois
  ///construtores serem constantes aqui já da true
  ///pelo fato de ambos serem constantes, ao invés
  ///de colocar em endereços de memória diferentes,
  ///o Dart aloca o mesmo hashCode para eles
  print('p1 == p2 > ${p1 == p2}');
  print('p1 == p2 && p1 == p3 > ${p1 == p2 && p1 == p3}');
}