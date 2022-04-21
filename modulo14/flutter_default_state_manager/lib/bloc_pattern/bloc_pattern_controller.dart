import 'dart:async';
import 'dart:math';

import 'package:flutter_default_state_manager/bloc_pattern/imc_state.dart';

class BlocPatternController {
  final _imcStreamController = StreamController<ImcState>.broadcast()
    ..add(ImcState(imc: 0));  
  Stream<ImcState> get imcOut => _imcStreamController.stream;
  // StreamSink<ImcState> get sink => _imcStreamController.sink;

  Future<void> calcularImc({required double peso, required double altura}) async {
    try {
      _imcStreamController.add(ImcStateLoading());

      await Future.delayed(Duration(seconds: 1));
      final imc = peso / pow(altura, 2);

      // throw Exception();

      _imcStreamController.add(ImcState(imc: imc));
    }
    catch (_) {
      _imcStreamController.add(ImcStateError(message: 'Erro ao calcular IMC'));
    }
  }

  void dispose() {
    _imcStreamController.close();
  }
}