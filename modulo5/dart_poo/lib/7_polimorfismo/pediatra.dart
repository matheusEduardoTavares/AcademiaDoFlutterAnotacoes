import 'package:dart_poo/7_polimorfismo/medico.dart';

class Pediatra extends Medico {
  @override
  void operar() {
    /// Examinar a criança no pós parto.
    print('Examinar a criança no pós parto');
  }

}