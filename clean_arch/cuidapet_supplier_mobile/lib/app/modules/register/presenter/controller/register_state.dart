
import 'package:equatable/equatable.dart';

import 'package:cuidapet_supplier_mobile/app/modules/register/presenter/view_models/register_input_model.dart';

class RegisterState extends Equatable {
  const RegisterState({
    required this.step,
    required this.model,
    this.error,
  });

  const RegisterState.start() : 
    step = 1,
    model = const RegisterInputModel(),
    error = null;

  final int step;
  final RegisterInputModel model;
  final String? error;

  @override
  List<Object?> get props => [
    step,
    model,
    error,
  ];

  RegisterState copyWith({
    int? step,
    RegisterInputModel? model,
    String? error,
  }) {
    return RegisterState(
      step: step ?? this.step,
      model: model ?? this.model,
      error: error ?? this.error,
    );
  }
}
