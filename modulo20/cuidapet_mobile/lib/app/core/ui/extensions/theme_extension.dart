import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  Color get primaryColor => Theme.of(this).primaryColor;
  Color get primaryColorDark => Theme.of(this).primaryColorDark;
  Color get primaryColorLight => Theme.of(this).primaryColorLight;
  // TODO! Verify theme update
  // ignore: deprecated_member_use
  Color get accentColor => Theme.of(this).accentColor;
  TextTheme get textTheme => Theme.of(this).textTheme;
}