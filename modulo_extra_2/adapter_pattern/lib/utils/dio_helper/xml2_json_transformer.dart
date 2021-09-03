import 'package:adapter_pattern/adapters/xml2_json_adapter.dart';
import 'package:dio/dio.dart';

class XML2JsonTransformer extends DefaultTransformer {
  @override 
  Future<Map<String, dynamic>> transformResponse(RequestOptions options, ResponseBody response) async {
    final stringResponse = await super.transformResponse(options, response);
    return XML2JsonAdapter.adapter(stringResponse);
  }
}