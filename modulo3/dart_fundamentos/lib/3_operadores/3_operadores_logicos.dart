void main() {
  // Operadores Lógicos:
  /// &&
  /// ||
  /// !
  
  final sexo = 'M';
  final idade = 18;
  final nome = 'Rodrigo';

  if (sexo == 'M' && idade > 17) {
    print('Pode entrar!!!');
  }
  else {
    print('Não pode entrar!!!');
  }

  if (sexo == 'M' || idade >= 18) {
    print('Pode entrar!!!');
  }
  else {
    print('Não pode entrar!!!');
  }

  if (!(sexo == 'M' && idade >= 18)) {
    print('Pode entrar!!!');
  }
  else {
    print('Não pode entrar!!!');
  }

  if (!(nome == 'Rodrigo')) {
    print('Não é o Rodrigo');
  }
}