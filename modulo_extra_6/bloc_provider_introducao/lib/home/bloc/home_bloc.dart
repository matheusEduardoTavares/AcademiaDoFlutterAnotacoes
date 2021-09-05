import 'package:bloc_provider_introducao/home/bloc/home_events.dart';
import 'package:bloc_provider_introducao/home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvents, HomeState> {
  HomeBloc() : super(HomeState(value: 0));

  @override
  Stream<HomeState> mapEventToState(HomeEvents event) async* {
    var counter = state.value;
    if (event is AddCounter) {
      yield state.copyWith(
        value: ++counter,
      );
    }
    else if (event is SubtractCounter) {
      yield HomeState(value: --counter);
    }
  }
}