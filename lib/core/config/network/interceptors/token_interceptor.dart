// lib/networking/interceptors/token_interceptor.dart
import 'package:dio/dio.dart';

import '../../db/shared_preferences/secure_storage.dart';

class TokenInterceptor extends Interceptor {
  final SecureStorage _prefs;
  final String tokenKey;

  TokenInterceptor(this._prefs, {this.tokenKey = SecureStorageKey.token});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Vérifie si la requête nécessite un token
    final requiresToken = options.extra['requiresToken'] == true;
    if (requiresToken) {
      // Récupère le token dans les préférences
      final token = await _prefs.getItem(key: tokenKey);

      if (token == null || token.isEmpty) {
        return handler.reject(
          DioException(
            requestOptions: options,
            type: DioExceptionType.badResponse,
            error: 'Token manquant',
          ),
        );

        // TODo: handle refresh token
        // final refreshSuccess = await _attemptRefreshToken();
        // if (!refreshSuccess) {
        //   // Si le refresh a échoué, on annule la requête
        //   return handler.reject(
        //     DioException(
        //       requestOptions: options,
        //       type: DioExceptionType.badResponse,
        //       error: 'Échec du refresh token',
        //     ),
        //   );
        // }
        // // Sinon, on récupère le nouveau token
        // final newToken = _prefs.getString('my_token_key');
        // if (newToken != null && newToken.isNotEmpty) {
        //   options.headers["Authorization"] = "Bearer $newToken";
        // }
      } else {
        // Ajouter le token au header
        options.headers["Authorization"] = "Bearer $token";
      }
    }
    super.onRequest(options, handler);
  }

  // TODo: Implementer la methode _attemptRefreshToken
  /// Tentative de refresh token (placeholder, à implémenter selon votre API)
  // Future<bool> _attemptRefreshToken() async {
  //   final refreshToken = _prefs.getString('my_refresh_token_key');
  //   if (refreshToken == null) {
  //     return false;
  //   }

  //   try {
  //     // Exemple d'appel API de refresh
  //     final response = await Dio().post(
  //       'https://exemple.com/api/refresh',
  //       data: {'refresh_token': refreshToken},
  //     );
  //     // Stocker le nouveau token
  //     final newToken = response.data['access_token'];
  //     _prefs.setString('my_token_key', newToken);
  //     return true;
  //   } catch (e) {
  //     return false;
  //   }
  // }
}


