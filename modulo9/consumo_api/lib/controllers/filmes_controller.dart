import 'package:consumo_api/repositories/filmes_repository.dart';

class FilmesController {
  final _filmesRepository = FilmesRepository();

  Future<void> findAll() async {
    final filmes = await _filmesRepository.findAll();

    filmes.forEach(print);
  }

  Future<void> findById(String id) async {
    final filme = await _filmesRepository.findById(id);

    print(filme);
  }
}