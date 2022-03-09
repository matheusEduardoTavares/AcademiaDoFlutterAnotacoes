import 'package:cuidapet_supplier_mobile/app/core/helpers/environments.dart';
import 'package:cuidapet_supplier_mobile/app/core/rest_client/rest_client.dart';
import 'package:cuidapet_supplier_mobile/app/core/rest_client/rest_client_exception.dart';
import 'package:cuidapet_supplier_mobile/app/core/rest_client/rest_client_response.dart';
import 'package:dio/dio.dart';

class DioRestClient implements RestClient {
  late Dio _dio;
  final _defaultBaseOptions = BaseOptions(
    baseUrl: Environments.param('base_url') ?? '',
    connectTimeout: int.tryParse(Environments.param('dio_connect_timeout') ?? '') ?? 60000,
    receiveTimeout: int.tryParse(Environments.param('dio_receive_timeout') ?? '') ?? 60000
  );

  DioRestClient({
    BaseOptions? options,
  }) {
    _dio = Dio(options ?? _defaultBaseOptions);
    _dio.interceptors.addAll([
      LogInterceptor(),
      //TODO Adicionar o AuthInterceptor
    ]);
  }

  @override
  RestClient auth() {
    _defaultBaseOptions.extra['auth_required'] = true;
    return this;
  }

  @override
  RestClient unauth() {
    _defaultBaseOptions.extra['auth_required'] = false;
    return this;
  }

  @override
  Future<RestClientResponse<T>> delete<T>(String path, {data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) async {
    try{
      final response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );

      return _dioResponseConverter<T>(response);
    }
    on DioError catch (e) {
      throw RestClientException(
        error: e.error,
        message: e.response?.statusMessage,
        response: _dioErrorResponseConverter(e.response),
        statusCode: e.response?.statusCode,
      );
    }
  }

  @override
  Future<RestClientResponse<T>> get<T>(String path, {Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) async {
    try{
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );

      return _dioResponseConverter<T>(response);
    }
    on DioError catch (e) {
      throw RestClientException(
        error: e.error,
        message: e.response?.statusMessage,
        response: _dioErrorResponseConverter(e.response),
        statusCode: e.response?.statusCode,
      );
    }
  }

  @override
  Future<RestClientResponse<T>> patch<T>(String path, {data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) async {
    try{
      final response = await _dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );

      return _dioResponseConverter<T>(response);
    }
    on DioError catch (e) {
      throw RestClientException(
        error: e.error,
        message: e.response?.statusMessage,
        response: _dioErrorResponseConverter(e.response),
        statusCode: e.response?.statusCode,
      );
    }
  }

  @override
  Future<RestClientResponse<T>> post<T>(String path, {data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) async {
    try{
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );

      return _dioResponseConverter<T>(response);
    }
    on DioError catch (e) {
      throw RestClientException(
        error: e.error,
        message: e.response?.statusMessage,
        response: _dioErrorResponseConverter(e.response),
        statusCode: e.response?.statusCode,
      );
    }
  }

  @override
  Future<RestClientResponse<T>> put<T>(String path, {data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) async {
    try{
      final response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );

      return _dioResponseConverter<T>(response);
    }
    on DioError catch (e) {
      throw RestClientException(
        error: e.error,
        message: e.response?.statusMessage,
        response: _dioErrorResponseConverter(e.response),
        statusCode: e.response?.statusCode,
      );
    }
  }

  @override
  Future<RestClientResponse<T>> request<T>(String path, {required String method, data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) async {
    try{
      final response = await _dio.request(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
          method: method,
        ),
      );

      return _dioResponseConverter<T>(response);
    }
    on DioError catch (e) {
      throw RestClientException(
        error: e.error,
        message: e.response?.statusMessage,
        response: _dioErrorResponseConverter(e.response),
        statusCode: e.response?.statusCode,
      );
    }
  }

  RestClientResponse<T> _dioResponseConverter<T>(Response response) {
    return RestClientResponse<T>(
      data: response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }

  RestClientResponse? _dioErrorResponseConverter(Response? response) {
    return RestClientResponse(
      data: response?.data,
      statusCode: response?.statusCode,
      statusMessage: response?.statusMessage,
    );
  }
}