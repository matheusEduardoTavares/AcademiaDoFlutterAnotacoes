void main() {
  ///Temos 6 tipos:
  /// ==
  /// !=
  /// >
  /// <
  /// >=
  /// <=
  
  final idade = 18;
  if (idade == 18) {
    print('Pode tirar habilitação');
  }
  if (idade > 17) {
    print('Pode tirar habilitação');
  }
  if (idade >= 18) {
    print('Pode tirar habilitação');
  }

  // final tipoPet = 'Cachorro';
  final tipoPet = 'Gato';

  if (tipoPet != 'Cachorro') {
    print('Desculpe, mas não temos nada para seu pet');
  }
}