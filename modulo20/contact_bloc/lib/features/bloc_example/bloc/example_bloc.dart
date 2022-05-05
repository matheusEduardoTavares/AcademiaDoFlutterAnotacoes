import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'example_event.dart';
part 'example_state.dart';

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  ExampleBloc() : super(ExampleStateInitial()) {
    on<ExampleFindNameEvent>(_findNames);
    on<ExampleRemoveNameEvent>(_removeName);
  }

  FutureOr<void> _removeName(ExampleRemoveNameEvent event, Emitter<ExampleState> emit) {
    final stateExample = state;
    if (stateExample is ExampleStateData) {
      final names = [...stateExample.names];
      names.retainWhere((element) => element != event.name);
      emit(ExampleStateData(names: names));
    }
  }

  FutureOr<void> _findNames(
    ExampleFindNameEvent event, 
    Emitter<ExampleState> emit
  ) async {
    final names = ['Rodrigo Rahman', 'Academia do Flutter', 'Flutter', 'Dart', 'Flutter Bloc'];

    await Future.delayed(const Duration(seconds: 2));

    emit(ExampleStateData(names: names));  
  }
}