import 'package:flutter/widgets.dart';

class NavigatorObserverCustom extends NavigatorObserver {
  @override
  // ignore: unnecessary_overrides
  void didPush(Route route, Route? previousRoute) {
    ///Antes de fazer o push
    super.didPush(route, previousRoute);
  }

  @override
  // ignore: unnecessary_overrides
  void didPop(Route route, Route? previousRoute) {
    ///Antes de sair da página
    super.didPop(route, previousRoute);
  }
}