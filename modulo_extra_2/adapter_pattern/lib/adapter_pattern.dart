import 'dart:convert';

import 'package:adapter_pattern/models/cep_model/cep_model.dart';
import 'package:adapter_pattern/utils/dio_helper/xml2_json_transformer.dart';
import 'package:dio/dio.dart';
import 'package:xml2json/xml2json.dart';

void run() async {
  ///O pattern chamado Adapter é um pattern de estrutura e não de criação. 
  ///Como o próprio nome sugere, é um padrão que ajuda em adaptações que sejam
  ///necessárias, como na caso de requisições a API que podem retornar um XML
  ///ou um JSON, se for um XML é necessário fazer vários parsers no caminho, 
  ///então podemos ter um adaptador para XML após ser feito a request.

  print('#############################################');
  print('JSON');
  final _normalGet = await Dio().get('https://viacep.com.br/ws/01001000/json/').then(
    (response) => CepModel.fromJson(response.data)
  ).then(
    (cepModel) {
      print(cepModel);
      print(cepModel.runtimeType);
    });

  print('#############################################');
  print('XML');

  final _withoutAdapterXMLResponse = await Dio().get('https://viacep.com.br/ws/01001000/xml')
    .then((response) {
      final parser = Xml2Json();
      parser.parse(response.data);
      return parser.toParker();
    }).then((modelStringJson) => json.decode(modelStringJson))
    .then((modelMap) => CepModel.fromJson(modelMap['xmlcep']))
    .then((cepModel) {
      print(cepModel);
      print(cepModel.runtimeType);
    });

  print('#############################################');
  print('XML COM ADAPTER');

  final dio = Dio();
  dio.transformer = XML2JsonTransformer();
  final _usingAdapterXMLResponse = await dio.get('https://viacep.com.br/ws/01001000/xml')
    .then((response) => CepModel.fromJson(response.data['xmlcep']));

  print(_usingAdapterXMLResponse);
  print(_usingAdapterXMLResponse.runtimeType);
  
}