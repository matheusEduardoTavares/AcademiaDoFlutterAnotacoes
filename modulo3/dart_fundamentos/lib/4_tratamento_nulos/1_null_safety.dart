String? nomeSuperior;

void main() {
  String nome = '';

  String? nomeNula;

  if (nomeNula != null) {
    nomeNula.isEmpty;
  }

  ///Ao atribuir algo a uma variável nullable, 
  ///automaticamente sua promoção é feita
  nomeNula = 'a';

  nome.isEmpty;
  nomeNula.isEmpty;

  var nomeLocal = nomeSuperior;
  if (nomeLocal != null) {
    ///Aqui usa uma variável auxiliar local só para
    ///que ela tenha promoção, pois como vimos atributos
    ///de classe e variáveis superiores não possuem 
    ///promoção.
    nomeLocal.isEmpty;
  }
  if (nomeSuperior != null) {
    nomeSuperior!.isEmpty;
  }
}