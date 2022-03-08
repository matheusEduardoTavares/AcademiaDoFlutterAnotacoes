import 'package:asuka/snackbars/asuka_snack_bar.dart';

class Messages {
  Messages._();

  static alert(String message) {
    AsukaSnackbar.alert(message).show();
  }  
}