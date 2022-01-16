abstract class UserRepository {
  Future<void> register(String email, String password);

  ///Retorna o access token
  Future<String> login(String login, String password);
}