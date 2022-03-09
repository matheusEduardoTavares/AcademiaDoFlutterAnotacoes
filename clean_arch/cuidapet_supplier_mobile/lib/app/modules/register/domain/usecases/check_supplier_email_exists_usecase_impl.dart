import 'package:cuidapet_supplier_mobile/app/modules/register/domain/repositories/register_user_repository.dart';
import 'package:cuidapet_supplier_mobile/app/modules/register/presenter/usecases/check_supplier_email_exists_usecase.dart';

class CheckSupplierEmailExistsUsecaseImpl implements CheckSupplierEmailExistsUsecase {

  CheckSupplierEmailExistsUsecaseImpl({
    required RegisterUserRepository registerUserRepository
  }) : _registerUserRepository = registerUserRepository;

  final RegisterUserRepository _registerUserRepository;

  @override
  Future<bool> execute(String email) => 
    _registerUserRepository.checkEmailSupplierExists(email);
  
}