import 'package:cuidapet_supplier_mobile/app/core/exceptions/failure_exception.dart';
import 'package:cuidapet_supplier_mobile/app/core/helpers/logger.dart';
import 'package:cuidapet_supplier_mobile/app/modules/register/domain/repositories/register_user_repository.dart';
import 'package:cuidapet_supplier_mobile/app/modules/register/infra/datasources/register_user_datasource.dart';

class RegisterUserRepositoryImpl implements RegisterUserRepository {

  RegisterUserRepositoryImpl({
    required RegisterUserDataSource registerUserDataSource,
    required Logger logger,
  })
  : 
  _registerUserDataSource = registerUserDataSource,
  _logger = logger;

  final RegisterUserDataSource _registerUserDataSource;
  final Logger _logger;

  @override
  Future<bool> checkEmailSupplierExists(String email) {
    try {
      return _registerUserDataSource.checkSupplierEmailExists(email); 
    }
    catch (e, s) {
      _logger.error('Erro ao verificar email', e, s);
      throw FailureException('Erro ao verificar email');
    }
  }
    
  
}