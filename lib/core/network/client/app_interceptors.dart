import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../service_locator/sl.dart';
import 'app_preferences.dart';

const String contentType = 'Content-Type';
const String authorization = 'Authorization';
const String applicationJson = 'application/json';

class AppInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');
    options.headers[contentType] = applicationJson;
    final token = sl<AppPreferences>().getToken();
    if (token != null) {
      options.headers[authorization] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    debugPrint(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
  }
}
