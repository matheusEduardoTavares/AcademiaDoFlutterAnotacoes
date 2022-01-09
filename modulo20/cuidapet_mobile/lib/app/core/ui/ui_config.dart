import 'package:flutter/material.dart';

class UiConfig {
  UiConfig._();

  static String get title => 'Cuidapet';

  static ThemeData get theme => ThemeData(
    primaryColor: const Color(0xFFA8CE48),
    primaryColorDark: const Color(0xFF689F38),
    primaryColorLight: const Color(0xFFDDEDC7),
    // ignore: deprecated_member_use
    accentColor: const Color(0xFF4CAF50),
  );
}