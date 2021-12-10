// ignore_for_file: file_names
import 'package:dart_poo/7_polimorfismo/medico.dart';
import 'package:dart_poo/7_polimorfismo/obstreta.dart';
import 'package:dart_poo/7_polimorfismo/pediatra.dart';
import 'package:dart_poo/7_polimorfismo/residente_anestesia.dart';

void main(List<String> args) {
  var medicos = <Medico>[
    ResidenteAnestesia(),
    // Anestesista(),
    Pediatra(),
    Obstreta(),
  ];

  /// Realizar um parto
  for (final medico in medicos) {
    medico.operar();
  }
}