import 'package:equatable/equatable.dart';

class AuthTokenEntity extends Equatable {
  final String accessToken;
  final String? refreshToken;
  final String tokenType;
  final DateTime expiresAt;

  const AuthTokenEntity({
    required this.accessToken,
    this.refreshToken,
    required this.tokenType,
    required this.expiresAt,
  });

  @override
  List<Object?> get props => [accessToken, refreshToken, tokenType, expiresAt];
}
