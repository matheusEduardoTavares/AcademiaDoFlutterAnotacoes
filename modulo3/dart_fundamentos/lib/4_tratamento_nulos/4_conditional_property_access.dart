import 'dart:math';

String? nomeCompleto;

void main() {
  /// V1
  /// Convencional
  // var nomeCompletoLocal = nomeCompleto;
  // if (nomeCompletoLocal != null) {
  //   print(nomeCompletoLocal.toUpperCase());
  // }
  // else {
  //   print('Nome não preenchido');
  // }

  /// V2
  /// Null Aware Operator
  // var nomeCompletoLocal = nomeCompleto ?? 'Nome não preenchido';
  // print(nomeCompletoLocal.toUpperCase());

  /// V3
  /// Conditional property access
  print(nomeCompleto?.toUpperCase() ?? 'Nome não preenchido');

  double? idade;
  if (Random().nextBool()) {
    idade = 18.5;
  }
  print(idade?.round() ?? 'Idade não preenchida');
}