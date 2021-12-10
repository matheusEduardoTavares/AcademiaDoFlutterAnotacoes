import 'package:dart_poo/7_polimorfismo/medico.dart';

class Anestesista extends Medico {
  @override
  void operar() {
    /// Preparar e esterelizar os equipamentos
    /// Anestesiar a paciente
    print('Preparar e esterelizar os equipamentos');
    print('Anestesiar a paciente');
  }

}