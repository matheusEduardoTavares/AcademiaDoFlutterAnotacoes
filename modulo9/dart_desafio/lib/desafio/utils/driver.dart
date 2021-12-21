import 'package:dart_desafio/desafio/models/city_model.dart';
import 'package:dart_desafio/desafio/models/state_model.dart';

abstract class Driver {
  Future<void> insertCities(List<CityModel> data);
  Future<void> insertStates(List<StateModel> data);
  Future<void> openConnection();
}