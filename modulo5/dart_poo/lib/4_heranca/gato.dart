import 'package:dart_poo/4_heranca/animal.dart';

class Gato extends Animal {
  Gato({
    required int idade
  }) : super(
    idade: idade,
  );

  @override
  int calcularIdadeHumana() {
    return idade * 15;
  }
  
}