import 'dart:io';

import 'package:factory_method/factories/android_dialog.dart';
import 'package:factory_method/factories/dialog_action.dart';
import 'package:factory_method/factories/idialog.dart';
import 'package:factory_method/factories/ios_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class DialogFactory {

  static Future<T?> showAlertDialog<T>(
    BuildContext context, {
      Widget? title,
      Widget? content,
      List<DialogAction>? actions,
    }
  ) {
    IDialog dialogData;

    if (Platform.isIOS) {
      dialogData = IosDialog();
    }
    else {
      dialogData = AndroidDialog();
    }

    return showDialog<T>(
      context: context, 
      builder: (context) => dialogData.create(
        context, 
        title ?? const Text('Não informado'), 
        content ?? const Text('Não informado'), 
        actions ?? <DialogAction>[],
      ),
    );
  }

}