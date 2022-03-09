abstract class RegisterUserRepository {
  Future<bool> checkEmailSupplierExists(String email);
}