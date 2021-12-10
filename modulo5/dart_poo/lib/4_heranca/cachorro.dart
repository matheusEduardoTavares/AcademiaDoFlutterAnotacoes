
import 'animal.dart';

class Cachorro extends Animal {
  Cachorro({
    required int idade
  }) : super(
    idade: idade,
  );

  ///Metadata
  @override
  int calcularIdadeHumana() {
    return idade * 7;
  }
  
}