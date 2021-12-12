import 'dart:mirrors';

import 'package:dart_poo/20_metadatas/fazer.dart';

import './pessoa.dart';

// ignore_for_file: avoid_function_literals_in_foreach_calls

void main(List<String> args) {
  final p1 = Pessoa();

  ///Todas traduções que são feitas de metadatas
  ///são feitas por meio de um package chamado 
  ///InstanceMirror
  
  InstanceMirror instanceMirror = reflect(p1);
  ///Com o ClassMirror, pegamos os metadata da 
  ///classe
  
  ClassMirror classMirror = instanceMirror.type;
  
  ///O [classMirror.metadata] retorna uma lista
  ///de ClassMirror, onde cada elemento é uma 
  ///instância de um metadata, então se a classe
  ///tem os metadata @deprecated e @gzip, o 
  ///[classMirror.metadata] será uma lista com 
  ///uma instância do deprecated e uma instância
  ///do gzip
  classMirror.metadata.forEach(print);

  ///Pegando as annotations de classes
  classMirror.metadata.forEach((annotation) {
    var instanceAnnotation = annotation.reflectee;

    if (instanceAnnotation is Fazer) {
      print('CLASS');
      print('quem: ${instanceAnnotation.quem}');
      print('oque: ${instanceAnnotation.oque}');
    }
  });

  ///Pegando as annotations de atributos / métodos
  classMirror.declarations.values.forEach((declarationMirror) {
    ///Atributo
    if (declarationMirror is VariableMirror) {
      declarationMirror.metadata.forEach((annotation) {
        var instanceAnnotation = annotation.reflectee;

        if (instanceAnnotation is Fazer) {
          print('VARIÁVEIS');
          print('quem: ${instanceAnnotation.quem}');
          print('oque: ${instanceAnnotation.oque}');
        }
      });
    }
    ///Método
    else if (declarationMirror is MethodMirror) {
      declarationMirror.metadata.forEach((annotation) {
        var instanceAnnotation = annotation.reflectee;

        if (instanceAnnotation is Fazer) {
          print('MÉTODOS');
          print('quem: ${instanceAnnotation.quem}');
          print('oque: ${instanceAnnotation.oque}');
        }
      });
    }
  });
}