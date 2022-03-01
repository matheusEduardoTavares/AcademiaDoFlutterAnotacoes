import 'package:cuidapet_supplier_mobile/app/core/local_storage/local_storage.dart';
import 'package:cuidapet_supplier_mobile/app/modules/core/auth/infra/drivers/auth_token_driver.dart';

class AuthTokenDriverImpl implements AuthTokenDriver {
  AuthTokenDriverImpl({
    required LocalStorage localStorage,
  }) : _localStorage = localStorage;

  final LocalStorage _localStorage;

  static const accessTokenKey = '/ACCESS_TOKEN_KEY/';

  @override
  Future<bool> checkUserLogged() => 
    _localStorage.contains(accessTokenKey);
  
}