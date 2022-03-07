import 'package:bloc/bloc.dart';
import 'package:cuidapet_supplier_mobile/app/modules/register/presenter/controller/register_event.dart';
import 'package:cuidapet_supplier_mobile/app/modules/register/presenter/controller/register_state.dart';

class RegisterController extends Bloc<RegisterEvent, RegisterState> {
  RegisterController() : super(const RegisterState.start()) {
    on<RegisterStepOneEvent>((event, emit) => emit(state.copyWith(
      step: 1,
      model: state.model,
    )));

    on<RegisterStepTwoEvent>((event, emit) => emit(state.copyWith(
      step: 2,
      model: state.model,
    )));

    on<RegisterStepRestartEvent>((event, emit) => emit(
      const RegisterState.start()
    ));

    // on<RegisterStepTwoEvent>((event, emit) => emit(state.copyWith(
    //   step: 2,
    //   model: state.model,
    // )));
  }

  void restartProcess() => 
    add(RegisterStepRestartEvent());
}