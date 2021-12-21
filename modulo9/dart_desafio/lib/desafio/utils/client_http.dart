abstract class ClientHttp {
  Future get({
    required String url,
    Map<String, String>? headers,
  });

  // Future post({
  //   required String url,
  //   required String serializedData,
  //   Map<String, String>? headers,
  // });
}