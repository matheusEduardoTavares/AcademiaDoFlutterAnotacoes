void main(List<String> args) {
  final idade = 30;

  print('Sua idade é ' + idade.toString());
  print('Sua idade é $idade');

  final valor = -20;

  if (valor.isNegative) {
    print(valor);
  }

  final valorDouble = 10.65;
  /// 11
  print(valorDouble.round());
  /// 11.0
  print(valorDouble.roundToDouble());

  final valorString = 'Rodrigo';
  
  /// Dá erro
  // final valorInt = int.parse(valorString);
  // print(valorInt);

  final valorInt2 = int.tryParse(valorString);
  /// null
  print(valorInt2);

  if (valorInt2 != null) {
    print('O valor é ${valorInt2 + 2}');
  }

  final precoCamiseta = 30.27876;
  print(precoCamiseta.toStringAsFixed(2));
}