import 'package:dart_desafio/desafio/models/state_model.dart';
import 'package:dart_desafio/desafio/models/city_model.dart';
import 'package:dart_desafio/desafio/utils/driver.dart';
import 'package:mysql1/mysql1.dart';

class MySqlDriver implements Driver {
  static MySqlConnection? _instance;

  @override
  Future<void> insertCities(List<CityModel> data) async {
    if (_instance == null) {
      await openConnection();
    }

    final formattedDataToInsert = data.map((e) => _instance!.query('insert into cidade(id, id_uf, nome) values ("${e.id}", "${e.idUF}", "${e.name}")'));

    await Future.wait(formattedDataToInsert);
    // for (final city in data) {
    //   await _instance!.query('insert into cidade(id, id_uf, nome) values ("${city.id}", "${city.idUF}", "${city.name}")');
    // }
  }

  @override
  Future<void> insertStates(List<StateModel> data) async {
    if (_instance == null) {
      await openConnection();
    }

    final formattedDataToInsert = data.map((e) => _instance!.query('insert into estado(id, uf, nome) values ("${e.id}", "${e.uf}", "${e.name}")'));

    await Future.wait(formattedDataToInsert);
  }

  @override
  Future<void> openConnection() async {
    final settings = ConnectionSettings(
      host: 'localhost',
      db: 'dart_desafio',
      password: 'password',
      user: 'root' 
    );

    _instance = await MySqlConnection.connect(settings);
  }

}