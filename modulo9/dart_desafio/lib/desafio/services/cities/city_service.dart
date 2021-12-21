import 'package:dart_desafio/desafio/models/city_model.dart';

abstract class CityService {
  Future<List<CityModel>?> getCities();

  Future<void> createCities({
    required List<CityModel> cities,
  });
}