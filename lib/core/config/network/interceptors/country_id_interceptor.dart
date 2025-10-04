import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../db/shared_preferences/secure_storage.dart';

/// Interceptor that injects custom headers into every request:
class CustomHeaderInterceptor extends Interceptor {
  final String countryIdKey;

  CustomHeaderInterceptor({
    this.countryIdKey = SecureStorageKey.countryId,
  });

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      await _addAppInfoHeaders(options);
    } catch (e) {
      log("Error adding custom headers: $e");
    }

    super.onRequest(options, handler);
  }

  /// Always add app info headers
  Future<void> _addAppInfoHeaders(RequestOptions options) async {
    final packageInfo = await PackageInfo.fromPlatform();
    options.headers.addAll({
      "App-Name": "Lamn",
      "App-Version": packageInfo.version.split('-').first,
    });
  }
}
