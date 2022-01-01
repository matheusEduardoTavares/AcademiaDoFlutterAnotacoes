import 'package:flutter/widgets.dart';
import 'package:provider/single_child_widget.dart';
import 'package:todo_list_provider/app/core/modules/todo_list_page.dart';

abstract class TodoListModule {
  TodoListModule({
    List<SingleChildWidget>? bindings,
    required Map<String, WidgetBuilder> routers,
  }) : _bindings = bindings, _routers = routers;
  
  final List<SingleChildWidget>? _bindings;
  final Map<String, WidgetBuilder> _routers;

  Map<String, WidgetBuilder> get routers {
    return _routers.map(
      (key, builder) => MapEntry(key, (_) => TodoListPage(
        page: builder,
        bindings: _bindings,
      ))
    );
  }
}
