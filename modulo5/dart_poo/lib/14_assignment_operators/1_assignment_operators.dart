String? nome;

void main(List<String> args) {
  /// São operator methods mas de assinatura, de
  /// atribuição, onde é alterado a própria 
  /// variável
  /// = -= /= %= >>= ^m
  /// += *= ~/= <<= &= != ??=
  var numero = 1;
  print(numero);

  numero += 2;
  print(numero);

  var numero2 = 2.0;
  numero2 /= 2;
  print(numero2);

  print(nome);
  nome ??= 'Rodriho Rahman';
  print(nome);
}