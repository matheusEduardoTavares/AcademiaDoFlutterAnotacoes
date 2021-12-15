import 'package:dart_async/8_repositories/repositories/cidade_repository.dart';
import 'package:dart_async/8_repositories/repositories/user_repository.dart';

void main(List<String> args) async {
  final cidadeRepository = CidadeRepository();
  final userRepository = UserRepository();

  try {
    var cidade = await cidadeRepository.buscarCidade();
    print(cidade);

    var user = await userRepository.findUser(1);
    print(user?.name ?? 'Usuário não encontrado');
  } on Exception {
    print('Erro ao buscar cidade');
  }
}