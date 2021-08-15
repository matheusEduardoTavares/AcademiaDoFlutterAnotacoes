import 'package:factory_method/factories/dialog_action.dart';
import 'package:factory_method/factories/idialog.dart';
import 'package:flutter/cupertino.dart';

class IosDialog implements IDialog {
  @override
  Widget create(BuildContext context, Widget title, Widget content, List<DialogAction>? actions) {
    return CupertinoAlertDialog(
      title: title,
      content: content,
      actions: actions?.map<Widget>((e) => CupertinoButton(
        child: e.child,
        onPressed: e.onPressed,
      )).toList() ?? <Widget>[],
    );
  }

}