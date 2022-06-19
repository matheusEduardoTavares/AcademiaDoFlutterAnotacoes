part of 'contact_cubit_update.dart';

@freezed
class ContactCubitUpdateState with _$ContactCubitUpdateState {
  factory ContactCubitUpdateState.initial() = _Initial;
  factory ContactCubitUpdateState.loading() = _Loading;
  factory ContactCubitUpdateState.error({
    required String error,
  }) = _Error;
  factory ContactCubitUpdateState.success() = _Success;
}