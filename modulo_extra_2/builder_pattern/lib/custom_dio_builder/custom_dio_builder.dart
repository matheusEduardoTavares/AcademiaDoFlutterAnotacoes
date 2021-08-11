import 'package:dio/dio.dart';

class CustomDioBuilder with Methods, Path, Headers, Parameters, QueryParameters, Run {
  late String _methodValue;
  late String _pathValue;
  Map<String, dynamic>? _headers;
  dynamic _dataValue;
  Map<String, dynamic>? _queryParameters;

  CustomDioBuilder._();

  static Methods get instance => CustomDioBuilder._();

  @override
  Path get() {
    _methodValue = 'get';
    return this;
  }

  @override
  Path patch() {
    _methodValue = 'patch';
    return this;
  }

  @override
  Path post() {
    _methodValue = 'post';
    return this;
  }

  @override
  Path put() {
    _methodValue = 'put';
    return this;
  }

  @override
  Headers path(String path) {
    _pathValue = path;
    return this;
  }

  @override
  Headers addHeader(String name, value) {
    _headers ??= {};
    _headers!.addAll({name: value});
    return this;
  }

  @override
  Parameters params() {
    return this;
  }

  @override
  Run data(data) {
    _dataValue = data;
    return this;
  }

  @override
  QueryParameters queryParameters() {
    return this;
  }

  @override
  QueryParameters addQueryParam(String name, value) {
    _queryParameters ??= {};
    _queryParameters!.addAll({name: value});
    return this;
  }

  @override
  Future<Response> run() {
    return Dio().request(
      _pathValue,
      options: Options(
        method: _methodValue,
        headers: _headers,
      ),
      queryParameters: _queryParameters,
      data: _dataValue,
    );
  }
}

abstract class Methods {
  Path post();
  Path get();
  Path put();
  Path patch();
}

abstract class Path {
  Headers path(String path);
}

abstract class Headers {
  Headers addHeader(String name, dynamic value);
  Parameters params();
}

abstract class Parameters {
  QueryParameters queryParameters();
  Run data(dynamic data);
}

abstract class QueryParameters {
  QueryParameters addQueryParam(String name, dynamic value);
  Future<Response> run();
}

abstract class Run {
  Future<Response> run();
}