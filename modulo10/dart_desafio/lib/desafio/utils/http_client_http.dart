import 'package:dart_desafio/desafio/utils/client_http.dart';
import 'package:http/http.dart' as http;

class HttpClientHttp implements ClientHttp {
  @override
  Future get({required String url, Map<String, String>? headers}) {
    return http.get(
      Uri.parse(url),
      headers: headers,
    );
  }

  // @override
  // Future post({required String url, required String serializedData, Map<String, String>? headers}) {
  //   return http.post(
  //     Uri.parse(url),
  //     body: serializedData,
  //     headers: headers,
  //   );
  // }

}