import 'dart:async';

///O main é considerado uma microTask, e
///é a primeira função a ser executada
///dentro do event loop
void main(List<String> args) {
  print('Início Main');

  scheduleMicrotask(() => print('Microtask #1'));
  print(DateTime.now());
  Future.delayed(Duration(seconds: 1), () {
    print(DateTime.now());
    print('Future #1 delayed');
  });
  Future(() => print('Future #2'));
  Future(() {
    for (var i = 0; i < 20000; i++) {
      
    }
  });
  Future(() => print('Future #3'));
  scheduleMicrotask(() => print('Microtask #2'));

  print('Fim Main');
}

/**
 * Event
 * Future.delayed #1 - 6
 * Future #2 - 4
 * Future #3 - 5
 */

/**
 * Microtask
 * Main - 1
 * Microtask #1 - 2
 * Microtask #2 - 3
 */