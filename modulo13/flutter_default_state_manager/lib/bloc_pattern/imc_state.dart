class ImcState {
  ImcState({
    required this.imc,
  });

  final double imc;
}

class ImcStateLoading extends ImcState {
  ImcStateLoading() : super(imc: 0);
}

class ImcStateError extends ImcState {
  ImcStateError({
    required this.message,
  }) : super(imc: 0);

  final String message;
}