import 'package:flutter/widgets.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:todo_list_provider/app/core/notifier/default_change_notifier.dart';
import 'package:todo_list_provider/app/core/ui/messages.dart';

class DefaultListenerNotifier {
  DefaultListenerNotifier({
    required this.changeNotifier,
  });

  final DefaultChangeNotifier changeNotifier;  

  void listener({
    required BuildContext context,
    required SuccessVoidCallback successCallback,
    ErrorVoidCallback? errorCallback,
    EverVoidCallback? everCallback,
  }) {
    changeNotifier.addListener(() {
      everCallback?.call(
        changeNotifier,
        this
      );
      
      if (changeNotifier.loading) {
        Loader.show(context);
      } else {
        Loader.hide();
      }

      if (changeNotifier.hasError) {
        errorCallback?.call(
          changeNotifier,
          this,
        );
        
        Messages.of(context).showError(changeNotifier.error ?? 'Erro interno');
      } 
      else if (changeNotifier.isSuccess) {
        successCallback(
          changeNotifier,
          this,
        );
      }
    });
  }

  void dispose() {
    changeNotifier.removeListener(() {});
  }
}

typedef SuccessVoidCallback = void Function(
  DefaultChangeNotifier notifier,
  DefaultListenerNotifier listenerInstance,
);

typedef ErrorVoidCallback = void Function(
  DefaultChangeNotifier notifier,
  DefaultListenerNotifier listenerInstance,
);

typedef EverVoidCallback = void Function(
  DefaultChangeNotifier notifier,
  DefaultListenerNotifier listenerInstance,
);