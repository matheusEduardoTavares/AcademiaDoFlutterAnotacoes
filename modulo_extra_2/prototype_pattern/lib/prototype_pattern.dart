import 'package:prototype_pattern/models/pessoa.dart';

void run() {
  final p1 = Pessoa();
  final p2 = p1.clone();

  print(p1.hashCode);
  print(p2.hashCode);

  print('----------');

  print(p1);
  print(p2);

  print('----------');

  p2.telefones!.removeAt(0);
  print(p1);
  print(p2);
}