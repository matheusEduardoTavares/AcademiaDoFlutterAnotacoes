import 'dart:convert';

import 'package:dart_desafio/desafio/models/city_model.dart';
import 'package:dart_desafio/desafio/services/cities/city_service.dart';
import 'package:dart_desafio/desafio/utils/client_http.dart';
import 'package:dart_desafio/desafio/utils/driver.dart';
import 'package:dart_desafio/desafio/utils/http_utilities.dart';
import 'package:http/http.dart';

class CityServiceImpl implements CityService {

  CityServiceImpl({
    required ClientHttp httpClient,
    required Driver driver,
  }) : 
    _httpClient = httpClient,
    _driver = driver;

  final ClientHttp _httpClient;
  final Driver _driver;

  @override
  Future<void> createCities({required List<CityModel> cities}) {
    return _driver.insertCities(
      cities,
    );
  }

  @override
  Future<List<CityModel>?> getCities() async {
    final Response data = await _httpClient.get(
      url: HttpUtilities.saoPauloDistrictsUrl, 
    );

    final List? decodedData = jsonDecode(data.body);
    final formattedData = decodedData?.map((e) => CityModel.fromMap(e)).toList();
    return formattedData;
  }
  
}