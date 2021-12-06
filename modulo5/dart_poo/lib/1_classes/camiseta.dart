/// Modificadores:
/// Público public
/// Privado private
/// Protegido protected
/// No dart não temos protected.

/// Características, comportamentos
class Camiseta {
  /// Atributos
  String? tamanho;
  String? _cor;
  String? marca;

  /// Atributo de classe
  static const String nome = 'Camiseta';

  /// Métodos de classe
  static String recuperarNome() => nome;

  /// Funções dentro de classes = métodos
  String tipoDeLavagem() {
    if (marca == 'Nike') {
      return 'Não pode lavar na máquina';
    }
    else {
      return 'Pode lavar na máquina';
    }
  }

  String? get cor => _cor;
  set cor(String? cor) {
    if (cor == 'Verde') {
      throw Exception('Não pode ser Verde');
    }

    _cor = cor;
  }
}

// ignore: unused_element
class _Camiseta2 {
  void recuperarCor() {
    var camiseta = Camiseta();
    camiseta._cor = 'Verde';
  }
}