import 'dart:convert';

import 'package:dart_desafio/desafio/models/state_model.dart';
import 'package:dart_desafio/desafio/services/states/state_service.dart';
import 'package:dart_desafio/desafio/utils/client_http.dart';
import 'package:dart_desafio/desafio/utils/driver.dart';
import 'package:dart_desafio/desafio/utils/http_utilities.dart';
import 'package:http/http.dart';

class StateServiceImpl implements StateService {

  StateServiceImpl({
    required ClientHttp httpClient,
    required Driver driver,
  }) : 
    _httpClient = httpClient,
    _driver = driver;

  final ClientHttp _httpClient;
  final Driver _driver;

  @override
  Future<List<StateModel>?> getStates() async {
    final Response data = await _httpClient.get(
      url: HttpUtilities.statesUrl, 
    );

    final List? decodedData = jsonDecode(data.body);
    final formattedData = decodedData?.map((e) => StateModel.fromMap(e)).toList();
    return formattedData;
  }

  @override
  Future<void> createStates({required List<StateModel> states}) {
    return _driver.insertStates(
      states,
    );
  }
  
}