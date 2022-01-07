import 'dart:math';

import 'package:mobx/mobx.dart';
part 'imc_controller.g.dart';

class ImcController = _ImcControllerBase with _$ImcController;

abstract class _ImcControllerBase with Store {

  @observable
  var imc = 0.0;

  @observable
  String? error;

  @computed 
  bool get hasError => error != null;

  @action
  Future<void> calcularIMC({
    required double peso,
    required double altura,
  }) async {
    try {
      imc = 0;
      error = null;
      
      await Future.delayed(Duration(seconds: 1));
      
      imc = peso / pow(altura, 2);

      if (imc > 30) {
        throw Exception();
      }
    } catch (e) {
      error = 'Erro ao calcular o IMC';
    }
  }
}