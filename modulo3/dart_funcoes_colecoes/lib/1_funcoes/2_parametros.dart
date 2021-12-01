// ignore_for_file: file_names
void main(List<String> args) {
  /// Parâmetros Obrigatórios por default
  print('A soma de 10 + 10 é ${somaInteiros(10, 10)}');

  /// Parâmetros Nomeados
  /// Parâmetros nomeados são nullables por default
  /// Parâmetros nomeados podem ser promidos para 
  /// non-null com checagem de null
  print('A soma de 10.2 + 10.2 é ${somaDoubles(
    numero1: 10.2, 
    numero2: 10.2
  )}');

  print('A soma de 5.2 + 10.2 é ${somaDoublesObrigatorio(
    numero2: 5.2,
    numero1: 10.2, 
  )}');

  print('A soma de 5.2 + 10.2 é ${somaDoublesObrigatorioPodendoSerNulo(
    numero2: null,
    numero1: 10.2, 
  )}');

  print('Chamadas com parâmetro default: ${somaDoublesObrigatoriosDefault(
    //Erro
    // numero2: null,
    numero1: 10.2, 
  )}');

  /// Parâmetro opcional
  print(somaIntOpcional());
  print(somaIntOpcional(1));
  print(somaIntOpcional(1, 2));
  print(parametrosNormaisComNomeados(10, idade: 25, nome: 'Rodrigo'));
  print(parametrosNormaisObrigatoriosEOpcionais(10, 'Rodrigo', 25));
}


int somaInteiros(int numero1, int numero2) {
  return numero1 + numero2;
}

double somaDoubles({double? numero1, double? numero2}) {
  if (numero1 != null && numero2 != null) {
    return numero1 + numero2;
  }

  return 0.0;
}

double somaDoublesObrigatorio({required double numero1, required double numero2}) {
  return numero1 + numero2;
}

double somaDoublesObrigatorioPodendoSerNulo({
  required double? numero1, 
  required double? numero2
}) {
  if (numero1 != null && numero2 != null) {
    return numero1 + numero2;
  }

  return 0.0;
}

double somaDoublesObrigatoriosDefault({
  double numero1 = 0, 
  double numero2 = 0,
}) {
  return numero1 + numero2;
}

int somaIntOpcional([int numero1 = 0, int numero2 = 0]) {
  return numero1 + numero2;
}

String parametrosNormaisComNomeados(int numero, { 
  required String nome,
  required int idade,
}) {
  return 'Número $numero, $nome tem $idade anos';
}

String parametrosNormaisObrigatoriosEOpcionais(int numero, [String? nome, int? idade]) {
  return 'Número $numero, ${nome ?? '-'} tem ${idade ?? '-'} anos';
}