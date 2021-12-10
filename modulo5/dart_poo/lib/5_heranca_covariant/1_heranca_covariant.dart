// ignore_for_file: file_names

import 'package:dart_poo/5_heranca_covariant/banana.dart';
import 'package:dart_poo/5_heranca_covariant/fruta.dart';
import 'package:dart_poo/5_heranca_covariant/humano.dart';
import 'package:dart_poo/5_heranca_covariant/macaco.dart';

void main(List<String> args) {
  var humano = Humano();
  humano.comer(Fruta());

  var macaco = Macaco();
  macaco.comer(Banana(tipo: 'Nanica'));
}