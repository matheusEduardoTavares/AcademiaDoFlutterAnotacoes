// ignore_for_file: file_names

void main() {
  final valorCalculado = somaInteiros(10, 10);

  print('A soma de dois inteiros é $valorCalculado');
}

int somaInteiros(int numero1, int numero2) {
  print('Executando a soma de inteiros $numero1 + $numero2');
  return numero1 + numero2;
}