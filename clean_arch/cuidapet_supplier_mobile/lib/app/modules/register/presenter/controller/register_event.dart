import 'package:equatable/equatable.dart';

class RegisterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterStepRestartEvent extends RegisterEvent {}

class RegisterStepOneEvent extends RegisterEvent {}

class RegisterStepTwoEvent extends RegisterEvent {
  RegisterStepTwoEvent({
    required this.name,
    required this.email,
  });

  final String name;
  final String email;

  @override
  List<Object?> get props => [
    name,
    email
  ];
}

class RegisterFinalizeEvent extends RegisterEvent {
  RegisterFinalizeEvent({
    required this.password,
    required this.category,
  });

  final String password;
  final int category;

  @override
  List<Object?> get props => [
    password,
    category
  ];
}