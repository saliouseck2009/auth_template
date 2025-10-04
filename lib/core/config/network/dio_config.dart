import 'package:dio/dio.dart';

const _baseUrl = "https://leukapi-test.laiterieduberger.sn/api/v1";
const _baseUrlV2 = "https://leukapi-test.laiterieduberger.sn/api/v2";
const _paymentBaseUrl = "https://api-payment-test.laiterieduberger.sn";

final dio = Dio(
  BaseOptions(
    baseUrl: _baseUrl,
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 30),
    sendTimeout: const Duration(seconds: 30),
  ),
);

final paymentDio = Dio(
  BaseOptions(
    baseUrl: _paymentBaseUrl,
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 30),
    sendTimeout: const Duration(seconds: 30),
  ),
);

final dioV2 = Dio(
  BaseOptions(
    baseUrl: _baseUrlV2,
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 30),
    sendTimeout: const Duration(seconds: 30),
  ),
);

class DioConfig {
  static getDio(String baseUrl) {
    return Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
      ),
    );
  }

  static getDioV2(String baseUrl) {
    // Convert v1 baseUrl to v2 by replacing /v1 with /v2
    final baseUrlV2 = baseUrl.replaceAll('/v1', '/v2');
    return Dio(
      BaseOptions(
        baseUrl: baseUrlV2,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
      ),
    );
  }
}

class Services {
  static final paymentService = "paymentService";
  static final serviceV2 = "serviceV2";
}
