
import '../../domain/entities/auth_token_entity.dart';

class AuthTokenModel extends AuthTokenEntity {
  const AuthTokenModel({
    required super.accessToken,
    super.refreshToken,
    required super.tokenType,
    required super.expiresAt,
  });

  factory AuthTokenModel.fromJson(Map<String, dynamic> json) {
    return AuthTokenModel(
      accessToken: json['access_token'] ?? '',
      refreshToken: json['refresh_token'],
      tokenType: json['token_type'] ?? 'Bearer',
      expiresAt: json['expires_at'] != null
          ? DateTime.parse(json['expires_at'])
          : DateTime.now().add(const Duration(hours: 24)),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
      'token_type': tokenType,
      'expires_at': expiresAt.toIso8601String(),
    };
  }

  AuthTokenModel copyWith({
    String? accessToken,
    String? refreshToken,
    String? tokenType,
    DateTime? expiresAt,
  }) {
    return AuthTokenModel(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      tokenType: tokenType ?? this.tokenType,
      expiresAt: expiresAt ?? this.expiresAt,
    );
  }
}
