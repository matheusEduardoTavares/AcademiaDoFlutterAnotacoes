import 'package:cuidapet_supplier_mobile/app/core/exceptions/failure_exception.dart';
import 'package:cuidapet_supplier_mobile/app/core/helpers/logger.dart';
import 'package:cuidapet_supplier_mobile/app/core/rest_client/rest_client.dart';
import 'package:cuidapet_supplier_mobile/app/modules/register/infra/datasources/register_user_datasource.dart';

class RegisterUserDataSourceImpl implements RegisterUserDataSource {
  const RegisterUserDataSourceImpl({
    required RestClient restClient,
    required Logger logger,
  }) : 
  _restClient = restClient,
  _logger = logger;

  final RestClient _restClient;
  final Logger _logger;

  @override
  Future<bool> checkSupplierEmailExists(String email) async {
    try {
      final res = await _restClient.get(
        '/suppliers/user',
        queryParameters: {
          'email': email,
        },
      );
      
      switch (res.statusCode) {
        case 200: 
          return true;
        case 204: 
          return false;
        default:
          throw FailureException('Status não tratado!!!');
      }
    } catch (e, s) {
      _logger.error('Erro ao verificar e-mail do usuário', e, s); 
      throw FailureException();
    }
  }
}