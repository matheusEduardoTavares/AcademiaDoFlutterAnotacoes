import 'dart:math';

import 'package:flutter/widgets.dart';

class ChangeNotifierController extends ChangeNotifier {
  var imc = 0.0;

  Future<void> calcularIMC({required double peso, required double altura}) async {
    imc = 0.0;
    notifyListeners();
    
    await Future.delayed(Duration(seconds: 1));
    imc = peso / pow(altura, 2);

    notifyListeners();
  }
}