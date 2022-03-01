import 'package:flutter/material.dart';

extension ThemeExtensions on BuildContext {
  Color get primaryColor => Theme.of(this).primaryColor;
  Color get primaryColorDark => Theme.of(this).primaryColorDark;
  Color get primaryColorLight => Theme.of(this).primaryColorLight;
  Color get accentColor => Theme.of(this).colorScheme.secondary;
  TextTheme get textTheme => Theme.of(this).textTheme;
}