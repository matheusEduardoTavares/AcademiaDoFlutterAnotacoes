import 'dart:io';

import 'package:dart_desafio/desafio/services/cities/city_service_impl.dart';
import 'package:dart_desafio/desafio/services/states/state_service_impl.dart';
import 'package:dart_desafio/desafio/utils/http_client_http.dart';
import 'package:dart_desafio/desafio/utils/mysql_driver.dart';

Future<void> main() async {
  final httpClientInstance = HttpClientHttp();
  final driverInstance = MySqlDriver();

  final stateService = StateServiceImpl(
    httpClient: httpClientInstance,
    driver: driverInstance,
  );

  final states = await stateService.getStates();

  if (states != null) {
    await driverInstance.insertStates(states);
  }

  print('Estados inseridos com sucesso !');

  final cityService = CityServiceImpl(
    httpClient: httpClientInstance,
    driver: driverInstance,
  );

  final cities = await cityService.getCities();

  if (cities != null) {
    await driverInstance.insertCities(cities);
  }

  print('Cidades inseridas com sucesso !');

  exit(0);
}