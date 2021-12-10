import 'package:dart_poo/5_heranca_covariant/banana.dart';
import 'package:dart_poo/5_heranca_covariant/mamifero.dart';

class Macaco extends Mamifero {
  @override
  void comer(covariant Banana fruta) {
    print(fruta.tipo);
  }
}