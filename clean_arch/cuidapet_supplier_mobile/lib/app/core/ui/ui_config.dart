import 'package:flutter/material.dart';

class UiConfig {
  UiConfig._();

  static ThemeData theme() => ThemeData(
    primaryColor: const Color(0xFFA8CE48),
    primaryColorDark: const Color(0xFF4CAF50),
    colorScheme: const ColorScheme(
      primary: Color(0xFFA8CE48),
      onPrimary: Colors.black,
      secondary: Color(0xFF4CAF50),
      onSecondary: Colors.black,
      background: Colors.white,
      onBackground: Colors.black,
      error: Colors.white,
      onError: Colors.black,
      surface: Colors.white,
      onSurface: Colors.black,
      brightness: Brightness.light,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: const Color(0xFFA8CE48)
      )
    ),
  );  
}