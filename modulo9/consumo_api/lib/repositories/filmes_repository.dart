import 'dart:convert';

import 'package:consumo_api/models/filme.dart';
import 'package:http/http.dart' as http;

class FilmesRepository {
  Future<List<Filme>> findAll() async {
    final filmesResponse = await http.get(Uri.parse('http://localhost:3031/filmes'));

    final filmesList = jsonDecode(filmesResponse.body) as List;

    return filmesList.map<Filme>((filmeMap) => Filme.fromMap(filmeMap)).toList();
  }

  Future<Filme> findById(String id) async {
    final response = await http.get(Uri.parse('http://localhost:3031/filmes/$id'));

    return Filme.fromJson(response.body);
  }
}