import 'package:builder_pattern/builders/pai_atributos_com_ordem_builder.dart';
import 'package:builder_pattern/builders/pai_atributos_sem_ordem_builder.dart';
import 'package:builder_pattern/models/filho_model.dart';

void execute() {
  ///Basicamente o Builder é um pattern criacional assim como o Singleton, de forma
  ///que ele serve para facilitar a construção de objetos de uma classe, uma vez
  ///que apenas usando a notação ponto é possível ir trocando os atributos da 
  ///classe de forma que a classe após setar o atributo sempre retorna si mesma, 
  ///e no fim temos um método builder que de fato retorna o model atualizado.
  ///Sua implementação pode ser feita de 2 formas:
  ///1. Sem levar em conta a ordem dos campos;
  ///2. Levando em conta a ordem dos campos;

  ///Abordagem 1
  final filho1 = PaiAtributosSemOrdemBuilder.instance
    .setIdade(18)
    .builder();

  print(filho1);

  final filho2 = PaiAtributosSemOrdemBuilder.instance
    .setIdade(18)
    .setNome('Nome')
    .setIdade(20)
    .setProfissao('Profissao')
    .addFilho(FilhoModel(
      idade: 20,
      nome: 'filho'
    ))
    .builder();

  print(filho2);

  print('------------------\n');

  ///Abordagem 2.
  final filho3 = PaiAtributosComOrdemBuilder.instance
    .setNome('oNome')
    .setIdade(10)
    .setProfissao('prof')
    .builder();

  print(filho3);

  final filho4 = PaiAtributosComOrdemBuilder.instance
    .setNome('oNome')
    .setIdade(10)
    .setProfissao('prof')
    .addFilho(FilhoModel(idade: 10, nome: 'Filho1'))
    .addFilho(FilhoModel(idade: 11, nome: 'Filho2'))
    .builder();

  print(filho4);

  ///Para funcionar isso, o contrato da idade que é o próximo campo após 
  ///o nome deve ter a definição para implementar o builder. Basicamente
  ///não retornamos a instância do model no singleton, e sim o contrato do 
  ///primeiro campo que deve ser preenchido, e esse contrato por sua vez 
  ///retorna o contrato do próximo campo que deve ser preenchido, e assim 
  ///nessa ordem sucessivamente. Os campos não obrigatórios basta implementar
  ///o builder, como nesse caso que foi comentado mas se o builder está no 
  ///contrato da idade, o setNome retorna o contrato da idade, então aí é só
  ///chamar o builder, sendo portanto retornado o model.
  // final filho5 = PaiAtributosComOrdemBuilder.instance
  //   .setNome('oNome')
  //   .builder();

  // print(filho5);
}