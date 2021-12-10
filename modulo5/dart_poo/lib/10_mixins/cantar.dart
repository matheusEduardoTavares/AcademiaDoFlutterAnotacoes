/// Existe duas formas de criar um mixin, com
/// a palavra mixin assim como o dancar.dart,
/// e a outra forma é criando uma classe abstrata
/// normal. Mas para classe abstrata 
/// ser tratada como um mixin, ela não pode 
/// extender outra classe, se não na hora de 
/// usar o with dará erro
abstract class Cantar {
  String cantar() {
    return 'Canta Rock';
  }

  String habilidade() {
    return 'Cantar';
  }
}