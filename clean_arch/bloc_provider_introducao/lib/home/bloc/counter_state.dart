class CounterState {
  CounterState({
    required this.value,
  });

  factory CounterState.initial() => CounterState(
    value: 0
  );

  int value;

  CounterState copyWith({
    int? value,
  }) {
    return CounterState(
      value: value ?? this.value,
    );
  }
}
