part of 'counter_bloc.dart';

abstract class CounterState extends Equatable {
  final int counter;

  const CounterState(this.counter);

  // @override
  // bool operator ==(Object other) {
  //   if (identical(this, other)) return true;
  
  //   // return other is CounterState;
  //   return other is CounterState &&
  //     other.counter == counter;
  // }

  // @override
  // int get hashCode => counter.hashCode;

  @override
  List<Object?> get props => [
    counter,
  ];
}

class CounterStateInitial extends CounterState {
  const CounterStateInitial() : super(0);
}

class CounterStateData extends CounterState {
  const CounterStateData(int counter) : super(counter);
}