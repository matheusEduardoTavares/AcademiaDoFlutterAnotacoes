import 'dart:math';

class SingletonStaticAccess {
  final int id = Random().nextInt(1000);

  static SingletonStaticAccess? _instance;

  SingletonStaticAccess._();

  static SingletonStaticAccess get instance {
    _instance ??= SingletonStaticAccess._();

    return _instance!;
  }
}