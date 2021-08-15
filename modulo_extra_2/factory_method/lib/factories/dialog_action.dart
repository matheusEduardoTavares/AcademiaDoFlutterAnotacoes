import 'package:flutter/widgets.dart';

class DialogAction<T> {
  DialogAction({
    required this.child,
    required this.onPressed,
  });

  T child;
  VoidCallback onPressed;
}
