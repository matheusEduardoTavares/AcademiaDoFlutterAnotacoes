import 'package:flutter/widgets.dart';

class DefaultChangeNotifier extends ChangeNotifier {
  bool _loading = false;
  String? _error;
  bool _success = false;
  String? _snackbarMessage;

  bool get loading => _loading;
  String? get error => _error;
  bool get hasError => _error != null;
  bool get isSuccess => _success;
  String? get snackbarMessage => _snackbarMessage;

  void showLoading() => _loading = true;
  void hideLoading() => _loading = false;

  void success() => _success = true;
  void setError(String? error) => _error = error;
  void setSnackbarMessage(String? snackbarMessage) => _snackbarMessage = snackbarMessage;

  void showLoadingAndResetState() {
    showLoading();
    resetState();
  }

  void resetState() {
    setError(null);
    _success = false;
    _snackbarMessage = null;
  }
}