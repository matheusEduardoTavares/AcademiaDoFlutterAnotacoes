import 'dart:io';

import 'package:factory_method/factories/android_dialog.dart';
import 'package:factory_method/factories/dialog_action.dart';
import 'package:factory_method/factories/idialog.dart';
import 'package:factory_method/factories/ios_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class DialogFactory {
  ///[GlobalKey] sempre é custoso para o 
  ///Flutter, então é interessante criá-la
  ///uma única vez usando o [static].
  static final navigatorKey = GlobalKey<NavigatorState>();

  static Future<T?> showAlertDialog<T>({
      Widget? title,
      Widget? content,
      List<DialogAction>? actions,
      bool? forceAndroid = false,
      bool? forceIos = false,
    }
  ){
    IDialog dialogData;

    if ((Platform.isIOS || (forceIos ?? false)) && !(forceAndroid ?? true)) {
      dialogData = IosDialog();
    }
    else if((Platform.isAndroid || (forceAndroid ?? false)) && !(forceIos ?? true)) {
      dialogData = AndroidDialog();
    } else {
      dialogData = AndroidDialog();
    }

    return showDialog<T>(
      context: DialogFactory.navigatorKey.currentState!.overlay!.context, 
      builder: (context) => dialogData.create(
        context, 
        title ?? const Text('Não informado'), 
        content ?? const Text('Não informado'), 
        actions ?? <DialogAction>[],
      ),
    );
  }

}