import 'package:freezed_annotation/freezed_annotation.dart';

part 'unions.freezed.dart';

///Aqui seria como criarmos 2 
///classes separadas
@freezed
class Example with _$Example {
  const factory Example.person(String name, int age) = Person;
  const factory Example.city(String name, int population) = City;
}

void main(List<String> args) {
  var example = Example.person('Rodrigo', 38);

  ///Como dentro da classe example temos 2
  ///classes, não conseguimos mais acessar
  ///o atributo de uma das classes. Só poderemos
  ///ter acesso se em todos construtores
  ///tivermos o mesmo atributo com mesmo nome,
  ///no caso o name é possível
  example.name;

  ///Agora, para conseguir acessar o age, temos
  ///que tratar o tipo
  if (example is Person) {
    example.age;
  }
}