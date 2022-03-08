import 'package:bloc/bloc.dart';
import 'package:cuidapet_supplier_mobile/app/core/ui/widgets/loader.dart';
import 'package:cuidapet_supplier_mobile/app/core/ui/widgets/messages.dart';
import 'package:cuidapet_supplier_mobile/app/modules/register/presenter/controller/register_controller.dart';
import 'package:cuidapet_supplier_mobile/app/modules/register/presenter/controller/register_event.dart';
import 'package:cuidapet_supplier_mobile/app/modules/register/presenter/usecases/check_supplier_email_exists_usecase.dart';
import 'package:cuidapet_supplier_mobile/app/modules/register/ui/steps/one/controller/register_step_one_state.dart';

class RegisterStepOneController extends Cubit<RegisterStepOneState> {
  RegisterStepOneController({
    required CheckSupplierEmailExistsUsecase checkEmailExists,
    required RegisterController registerController,
  }) : 
  _checkEmailExists = checkEmailExists,
  _registerController = registerController,
  super(RegisterStepOneState());

  final CheckSupplierEmailExistsUsecase _checkEmailExists;
  final RegisterController _registerController;

  Future<void> nextStep({
    required String name, 
    required String email
  }) async {
    if (!await _isEmailExists(email)) {
      _registerController.add(
        RegisterStepTwoEvent(name: name, email: email)
      );
    }
  }

  Future<bool> _isEmailExists(String email) async {
    try {
      Loader.show();
      
      final emailExists = await _checkEmailExists.execute(email);
      Loader.hide();
      
      if (emailExists) {
        Messages.alert('E-mail já cadastrado, por favor selecione outro e-mail');
      }
      
      return emailExists;
    } catch (e) {
      Loader.hide();
      Messages.alert('Erro ao validar e-mail'); 
      return true;
    }
  }
}