import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/core/ui/theme_extensons.dart';

class Messages {
  Messages._(this.context);

  factory Messages.of(BuildContext context) {
    return Messages._(context);
  }

  final BuildContext context;

  void showError(String message) {
    _showMessage(message, Colors.red);
  }

  void showInfo(String message) {
    _showMessage(message, context.primaryColor);
  }

  void _showMessage(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      )
    );
  }
}