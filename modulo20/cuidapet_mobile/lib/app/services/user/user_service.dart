abstract class UserService {
  Future<void> register(String email, String password);

  ///Aqui é void pois não faz sentido retornar para
  ///tela o access token, ele é algo de controle 
  ///nosso apenas
  Future<void> login(String login, String password);
}