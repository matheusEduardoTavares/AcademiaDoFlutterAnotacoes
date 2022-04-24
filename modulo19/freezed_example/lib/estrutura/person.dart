import 'package:freezed_annotation/freezed_annotation.dart';

part 'person.freezed.dart';

///Em classes freezed, não temos
///atributos dentro delas, temos vários
///construtores nomeados
@freezed
class Person with _$Person {
  factory Person({
    String? name,
    int? age
  }) = _Person;
}

void main(List<String> args) {
  final person = Person(
    name: 'Rodrigo',
    age: 38,
  );

  ///Essa classe já vem com
  ///o copyWith e o toString 
  ///implementados
  print(person.age);
  print(person.name);
  print(person);
}