import 'package:dart_poo/10_mixins/artista.dart';

/// Um mixin nada mais é que outra forma de definir
/// classes, de forma que possamos herdar múltiplas 
/// classes via o mixin.
/// Para criar um mixin usamos a palavra reservada
/// mixin como se fosse uma classe, e podemos 
/// por uma condição de onde ele será usado com
/// o on, então, nesse caso, uma classe só 
/// poderá usar o mixin se ela for um Artista.
/// Sua forma de uso é igual de uma classe normal.
mixin Dancar on Artista {
  String dancar() {
    return 'Dança Forró';
  }

  @override
  String habilidade() {
    return 'Dançar';
  }
}