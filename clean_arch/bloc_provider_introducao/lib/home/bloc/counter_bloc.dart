import 'package:bloc_provider_introducao/home/bloc/counter_event.dart';
import 'package:bloc_provider_introducao/home/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    on<CounterAdd>((event, emit) => emit(state.copyWith(value: state.value + 1)));
    on<CounterSubtract>((event, emit) => emit(state.copyWith(value: state.value - 1)));
  }
}