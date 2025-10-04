import 'dart:io';

import 'package:dio/dio.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:voyage/core/config/network/interceptors/country_id_interceptor.dart' show CustomHeaderInterceptor;

import '../db/shared_preferences/secure_storage.dart';
import 'errors/network_exceptions.dart';
import 'interceptors/token_interceptor.dart';

class NetworkingService {
  final Dio _dio;
  final SecureStorage _prefs;

  NetworkingService({required Dio dio, required SecureStorage prefs})
    : _dio = dio,
      _prefs = prefs {
    dio.interceptors.add(PrettyDioLogger());
    _dio.interceptors.add(TokenInterceptor(_prefs));
    _dio.interceptors.add(CustomHeaderInterceptor());
  }

  /// Permet de changer dynamiquement le baseUrl si nécessaire.
  void updateBaseUrl(String newBaseUrl) {
    _dio.options.baseUrl = newBaseUrl;
  }

  // ===========================================================================
  // =============== Méthodes GET, POST, PUT, PATCH, DELETE, etc. ==============
  // ===========================================================================
  //
  // On utilise un paramètre booléen `requiresToken` pour indiquer qu'une requête
  // spécifique nécessite un token. L'intercepteur de token gèrera l'injection
  // (ou la tentative de refresh si besoin).

  Future<Response> get(
    String endpoint, {
    bool requiresToken = false,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final mergedOptions = _mergeOptions(options, requiresToken);
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: mergedOptions,
      );
      return response;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Response> post(
    String endpoint, {
    bool requiresToken = false,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final mergedOptions = _mergeOptions(options, requiresToken);
      final response = await _dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: mergedOptions,
      );
      return response;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Response> put(
    String endpoint, {
    bool requiresToken = false,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final mergedOptions = _mergeOptions(options, requiresToken);
      final response = await _dio.put(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: mergedOptions,
      );
      return response;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Response> patch(
    String endpoint, {
    bool requiresToken = false,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final mergedOptions = _mergeOptions(options, requiresToken);
      final response = await _dio.patch(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: mergedOptions,
      );
      return response;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Response> delete(
    String endpoint, {
    bool requiresToken = false,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final mergedOptions = _mergeOptions(options, requiresToken);
      final response = await _dio.delete(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: mergedOptions,
      );
      return response;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Options _mergeOptions(Options? originalOptions, bool requiresToken) {
    final newOptions = originalOptions ?? Options();
    final currentExtra = newOptions.extra;

    final safeExtra = currentExtra == null
        ? <String, dynamic>{}
        : Map<String, dynamic>.from(currentExtra);

    safeExtra['requiresToken'] = requiresToken;

    newOptions.extra = safeExtra;

    return newOptions;
  }

  // ===========================================================================
  // ========================== GESTION DES ERREURS ============================
  // ===========================================================================
  Exception _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ClientException("Le délai de connexion au serveur a expiré.");
      case DioExceptionType.sendTimeout:
        return ClientException("Le délai d'envoi de la requête a expiré.");
      case DioExceptionType.receiveTimeout:
        return ClientException("Le délai de réception de la réponse a expiré.");
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        final responseData = e.response?.data;

        // if (statusCode == 401) {
        //   return Exception(
        //     "Vous n'êtes pas autorisé à effectuer cette action (401).",
        //   );
        // } else if (statusCode == 403) {
        //   return Exception(
        //     "Accès refusé. Vous n'avez pas les droits nécessaires (403).",
        //   );
        // } else if (statusCode == 404) {
        //   return Exception("La ressource demandée est introuvable (404).");
        // } else if (statusCode == 500) {
        //   return Exception(
        //     "Une erreur interne est survenue sur le serveur (500).",
        //   );
        // } else {
        final message =
            _extractErrorMessage(responseData) ??
            "Une erreur s'est produite (code: $statusCode).";
        return Exception(message);
      // }

      case DioExceptionType.badCertificate:
        return ClientException("Certificat SSL invalide ou inconnu.");

      case DioExceptionType.cancel:
        return ClientException("La requête a été annulée.");

      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
        if (e.error is SocketException) {
          return InternetException(
            "Aucune connexion internet. Vérifiez votre réseau.",
          );
        }
        return Exception(e.message ?? "Une erreur inconnue s'est produite.");
    }
  }

  /// Exemple d’extraction de message d’erreur depuis le body

  String? _extractErrorMessage(dynamic responseData) {
    if (responseData is Map<String, dynamic>) {
      if (responseData.containsKey('error')) {
        if (responseData['error'] is String?) {
          return responseData['error'] as String?;
        }
        if (responseData['error'] is List<String?>) {
          return (responseData['error'] as List<String?>).join(', ');
        }
        return null;
      }
      if (responseData.containsKey('ERROR_CODE')) {
        return responseData['ERROR_CODE'] as String?;
      }
      if (responseData.containsKey('message')) {
        if (responseData['message'] is String?) {
          return responseData['message'] as String?;
        }
        if (responseData['message'] is List<String?>) {
          return (responseData['message'] as List<String?>).join(', ');
        }
        if (responseData.containsKey('ERROR_CODE')) {
          return responseData['ERROR_CODE'] as String?;
        }
        return null;
      }
    }
    return null;
  }
}
