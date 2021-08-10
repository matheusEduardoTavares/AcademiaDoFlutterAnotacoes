import 'dart:math';

class SingletonAccessInstance {
  final int id = Random().nextInt(1000);

  static SingletonAccessInstance? _instance;

  SingletonAccessInstance._();

  factory SingletonAccessInstance() {
    _instance ??= SingletonAccessInstance._();

    return _instance!;
  }
}