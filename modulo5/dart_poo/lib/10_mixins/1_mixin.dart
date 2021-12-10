// ignore_for_file: file_names
import 'package:dart_poo/10_mixins/joao.dart';

void main(List<String> args) {
  /// Ele herdou todos os métodos tanto do 
  /// mixin quanto da classe pai. Então joao é
  /// um Artista, é um Cantar, e é um Dancar,
  /// o mixin veio para resolver a herança 
  /// múltipla, basicamente
  var joao = Joao();

  /// A última classe que for carregada, se 
  /// tiver um método com mesmo nome e assinatura
  /// das classes anteriores irá sobrescrever o 
  /// método das classes anteriores que foram 
  /// carregadas
  print(joao.habilidade());
  print(joao.cantar());
  print(joao.dancar());
}