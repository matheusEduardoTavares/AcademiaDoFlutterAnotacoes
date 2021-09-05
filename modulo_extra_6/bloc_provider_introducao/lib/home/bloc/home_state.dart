class HomeState {
  HomeState({
    required this.value,
  });

  final int value;

  ///PrototypePattern
  HomeState copyWith({
    int? value,
  }) => HomeState(
    value: value ?? this.value,
  );
}