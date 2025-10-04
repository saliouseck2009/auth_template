import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

import '../../models/auth_token_model.dart';
import '../../models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<void> saveUser(UserModel user);
  Future<UserModel?> getUser();
  Future<void> saveAuthToken(AuthTokenModel token);
  Future<AuthTokenModel?> getAuthToken();
  Future<bool> hasValidToken();
  Future<void> clearAuthData();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final FlutterSecureStorage storage;

  AuthLocalDataSourceImpl({required this.storage});

  static const String _userKey = 'user_data';
  static const String _tokenKey = 'auth_token';

  @override
  Future<void> saveUser(UserModel user) async {
    final userJson = json.encode(user.toJson());
    await storage.write(key: _userKey, value: userJson);
  }

  @override
  Future<UserModel?> getUser() async {
    try {
      final userJson = await storage.read(key: _userKey);
      if (userJson != null) {
        final userMap = json.decode(userJson) as Map<String, dynamic>;
        return UserModel.fromJson(userMap);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> saveAuthToken(AuthTokenModel token) async {
    final tokenJson = json.encode(token.toJson());
    await storage.write(key: _tokenKey, value: tokenJson);
  }

  @override
  Future<AuthTokenModel?> getAuthToken() async {
    try {
      final tokenJson = await storage.read(key: _tokenKey);
      if (tokenJson != null) {
        final tokenMap = json.decode(tokenJson) as Map<String, dynamic>;
        return AuthTokenModel.fromJson(tokenMap);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> hasValidToken() async {
    try {
      final token = await getAuthToken();
      if (token == null) return false;

      // Check if token is not expired
      return token.expiresAt.isAfter(DateTime.now());
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> clearAuthData() async {
    await storage.delete(key: _userKey);
    await storage.delete(key: _tokenKey);
  }
}
