import 'package:test/test.dart';

void main() {
  // test('', () {});
  // testWidget

  test('Teste sem grupo', () {
    throw Exception();
  });

  group('Grupo de teste', () {
    test('Teste dentro do grupo 1', () {
      
    });

    test('Teste dentro do grupo 2', () {

    });

    test('Teste dentro do grupo 3', () {

    });
  });
}