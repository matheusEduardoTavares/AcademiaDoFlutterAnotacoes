import 'dart:async';

void main(List<String> args) async {
  print('Início Main');

  scheduleMicrotask(() => print('Microtask #1'));
  await Future.delayed(Duration(seconds: 1), () {
    print('Future #1 delayed');
  });
  await Future(() {
    var i = 0;
    while(i < 20000) {
      i++;
    }
    print('Future #2');
  });
  scheduleMicrotask(() => print('Microtask #2'));
  await Future(() => print('Future #3'));
  scheduleMicrotask(() => print('Microtask #3'));

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