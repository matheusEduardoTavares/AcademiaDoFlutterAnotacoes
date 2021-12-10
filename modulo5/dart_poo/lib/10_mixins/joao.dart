import 'package:dart_poo/10_mixins/artista.dart';
import 'package:dart_poo/10_mixins/cantar.dart';
import 'package:dart_poo/10_mixins/dancar.dart';

/// O with vai entre o extends e o implements
// class Joao extends Artista with Dancar implements ArtistaInterface {

// }

/// Não funciona pq o mixin dancar tem um on para 
/// Artista, então, como Joao aqui não é artista,
/// não funciona
// class Joao with Dancar {

// }

/// Não podemos dar um extends em um mixin criado
/// com a palavra reservada mixin, mas se for
/// criado com uma classe abstrata, aí é possível,
/// não podemos usar um extends em um mixin, mas podemos
/// usar um with para usar uma classe abstrata
/// como um mixin

class Joao extends Artista with Dancar, Cantar {

}

// abstract class ArtistaInterface {}