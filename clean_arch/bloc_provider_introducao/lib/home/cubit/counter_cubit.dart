import 'package:bloc/bloc.dart';
import 'package:bloc_provider_introducao/home/bloc/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState.initial());

  void add() {
    emit(state.copyWith(value: state.value + 1));
  }

  void subtract() {
    emit(state.copyWith(value: state.value - 1));
  }
}