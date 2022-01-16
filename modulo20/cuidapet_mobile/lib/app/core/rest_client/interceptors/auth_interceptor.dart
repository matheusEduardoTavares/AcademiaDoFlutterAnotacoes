import 'package:cuidapet_mobile/app/core/helpers/constants.dart';
import 'package:dio/dio.dart';

import 'package:cuidapet_mobile/app/core/helpers/logger.dart';
import 'package:cuidapet_mobile/app/core/local_storages/local_security_storage.dart';
import 'package:cuidapet_mobile/app/core/local_storages/local_storage.dart';
import 'package:flutter/foundation.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor({
    required LocalStorage localStorage,
    required LocalSecurityStorage localSecurityStorage,
    required Logger log,
  }) : 
  _localStorage = localStorage,
  _localSecurityStorage = localSecurityStorage,
  _log = log;

  final LocalStorage _localStorage;
  final LocalSecurityStorage _localSecurityStorage;
  final Logger _log;

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.extra['auth_required'] == true) {
      final accessToken = await _localStorage.read<String>(Constants.ACCESS_TOKEN_KEY);

      if (accessToken == null) {
        // Logout!!!

        ///O handler do dio permite rejeitar para que pare as requisições
        ///que seriam executadas, tem o next para ir para a próxima e tem 
        ///o resolve para finalizar as requisições retornando o valor final.
        return handler.reject(
          DioError(
            requestOptions: options,
            error: 'Expire Token',
            type: DioErrorType.cancel,
          )
        );
      }

      options.headers['Authorization'] = accessToken;
    }

    if (!kReleaseMode) {
      _log.append('############### Request LOG ###############');
      _log.append('url: ${options.uri}');
      _log.append('method: ${options.method}');
      _log.append('data: ${options.data}');
      _log.append('headers: ${options.headers}');
      _log.append('############### Request LOG ###############');
      _log.closeAppend();
    }

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (!kReleaseMode) {
      _log.append('############### Response LOG ###############');
      _log.append('data: ${response.data}');
      _log.append('############### Response LOG ###############');
      _log.closeAppend();
    }

    return handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    _log.append('############### Error LOG ###############');
    _log.append('Response error: ${err.response}');
    _log.append('############### Error LOG ###############');
    _log.closeAppend();

    return handler.next(err);
  }
}
