// ignore_for_file: file_names
import 'somas/soma.dart';
import 'somas_nova/soma.dart' as soma_nova;
// import 'package:dart_funcoes_colecoes/7_imports/somas/soma.dart';

void main(List<String> args) {
  var totalDoubles = somaDoubles(10.1, 5.1);
  print('Total de doubles: $totalDoubles');

  var totalInteiros = soma_nova.somaInteiros(10, 5);
  print('Total de inteiros: $totalInteiros');
}
