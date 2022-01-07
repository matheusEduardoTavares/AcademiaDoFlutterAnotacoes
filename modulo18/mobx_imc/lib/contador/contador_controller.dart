import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_imc/models/full_name.dart';

class ContadorController {
  ContadorController() {
    increment = Action(_incrementCounter, name: 'CounterObservable');
    _saudacaoComputed = Computed(() => 'Olá ${fullName.first}');
  }

  late Action increment;
  late Computed _saudacaoComputed;

  void _incrementCounter() {
    _counter.value++;
    debugPrint(_fullName.value.hashCode.toString());
    // ! Não pode fazer isso aqui:
    // _fullName.value.first = 'Rodrigo';
    // _fullName.value.last = 'Rahman';

    _fullName.value = _fullName.value.copyWith(
      first: 'Rodrigo',
      last: 'Rahman',
    );

    debugPrint(_fullName.value.hashCode.toString());
  }

  final _counter = Observable<int>(0);
  int get counter => _counter.value;

  final _fullName = Observable<FullName>(FullName(first: 'first', last: 'last'));
  FullName get fullName => _fullName.value;

  ///Até funciona, mas o ideal é usar o computed, pois
  ///esse getter não é só o objeto do value do 
  ///observable, é ele junto de uma string, portanto,
  ///é um estado derivado, pois o estado core é só
  ///o value do observable. Estados derivados o ideal
  ///é criarmos Computed para eles, embora funcione
  ///assim também. O estado derivado pode derivar de 
  ///mais de um core state também.
  // String get saudacao => 'Olá ${fullName.first}';
  String get saudacao => _saudacaoComputed.value;
}