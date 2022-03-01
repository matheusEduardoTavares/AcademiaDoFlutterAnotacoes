import 'package:cuidapet_supplier_mobile/app/modules/core/auth/domain/repositories/auth_token_repository.dart';
import 'package:cuidapet_supplier_mobile/app/modules/core/auth/presenter/usecases/check_user_logged_usecase.dart';

class CheckUserLoggedUsecaseImpl implements CheckUserLoggedUsecase {

  CheckUserLoggedUsecaseImpl({
    required AuthTokenRepository authTokenRepository,
  }) : _authTokenRepository = authTokenRepository;

  final AuthTokenRepository _authTokenRepository;

  @override
  Future<bool> execute() => _authTokenRepository.checkUserLogged();
}