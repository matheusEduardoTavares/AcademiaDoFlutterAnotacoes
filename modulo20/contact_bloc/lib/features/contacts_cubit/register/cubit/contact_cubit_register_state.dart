part of 'contact_cubit_register.dart';

@freezed
class ContactCubitRegisterState with _$ContactCubitRegisterState {
  factory ContactCubitRegisterState.initial() = _Initial;
  factory ContactCubitRegisterState.loading() = _Loading;
  factory ContactCubitRegisterState.error({
    required String error,
  }) = _Error;
  factory ContactCubitRegisterState.success() = _Success;
}