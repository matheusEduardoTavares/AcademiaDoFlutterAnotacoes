// ignore_for_file: file_names

void main() {
  print(somaInteiros(10, 10));
  somaInteirosVoid(10, 10);

  () {
    print('Função Anônima');
  }();

  ///Não está invocando a função
  somaInteiros;

  ///É possível associar uma função a uma variável,
  ///isso é chamado de closure
  // ignore: prefer_function_declarations_over_variables
  var funcaoQualquer = () {
    print('Função qualquer');
    return '2000';
  };
  print(funcaoQualquer);
  print(funcaoQualquer.runtimeType);
  print(funcaoQualquer());

  chamarUmaFuncaoDeUmParametro((nome) {
    print('meu nome é $nome');
  });
}

/// 3 partes
/// 1 tipo de retorno
/// 2 nome
/// 3 parâmetros
int somaInteiros(int numero1, int numero2) => 
  numero1 + numero2;

void somaInteirosVoid(int numero1, int numero2) => 
  numero1 + numero2;

void chamarUmaFuncaoDeUmParametro(void Function(String nome) funcaoQueRecebeONome) {
  final nomeCompleto = 'Rodrigo Rahman';
  funcaoQueRecebeONome(nomeCompleto);
}

void chamarUmaFuncaoDeUmParametro2(FuncaoQueRecebeNome funcaoQueRecebeONome) {
  final nomeCompleto = 'Rodrigo Rahman';
  funcaoQueRecebeONome(nomeCompleto);
}

typedef FuncaoQueRecebeNome = void Function(String nome);