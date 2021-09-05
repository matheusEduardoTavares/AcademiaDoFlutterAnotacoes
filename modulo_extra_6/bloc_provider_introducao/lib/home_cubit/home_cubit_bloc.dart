import 'package:bloc/bloc.dart';
import 'package:bloc_provider_introducao/home/bloc/home_state.dart';

class HomeCubitBloc extends Cubit<HomeState> {
  HomeCubitBloc() : super(HomeState(value: 0));

  void add() {
    var value = state.value;
    emit(state.copyWith(value: ++value));
  }

  void subtract() {
    var value = state.value;
    emit(HomeState(value: --value));
  }
}