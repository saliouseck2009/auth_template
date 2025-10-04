import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint("--> [${options.method}] ${options.uri}");
    if (options.data != null) debugPrint("Data: ${options.data}");
    if (options.queryParameters.isNotEmpty) {
      debugPrint("QueryParams: ${options.queryParameters}");
    }
    debugPrint("Headers: ${options.headers}");
    debugPrint("--> Fin de la requête");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint("<-- [${response.statusCode}] ${response.requestOptions.uri}");
    debugPrint("Data: ${response.data}");
    debugPrint("<-- Fin de la réponse");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint("Erreur [${err.type}] : ${err.message}");
    debugPrint("URL: ${err.requestOptions.uri}");
    if (err.response != null) {
      debugPrint("Code: ${err.response?.statusCode}, Data: ${err.response?.data}");
    }
    super.onError(err, handler);
  }
}
