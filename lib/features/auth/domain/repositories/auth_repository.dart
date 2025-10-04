

import '../../../../core/data_state/data_state.dart';
import '../entities/auth_token_entity.dart';
import '../entities/user_entity.dart';

abstract class AuthRepository {
  /// Login with email and password
  Future<DataState<UserEntity>> login({
    required String email,
    required String password,
  });

  /// Register new user
  Future<DataState<UserEntity>> register({
    required String username,
    required String email,
    required String password,
    String? phone,
  });

  /// Logout current user
  Future<DataState<void>> logout();

  /// Check if user has valid token
  Future<bool> hasValidToken();

  /// Get current user from local storage
  Future<UserEntity?> getCurrentUser();

  /// Save user to local storage
  Future<void> saveUser(UserEntity user);

  /// Save auth token to local storage
  Future<void> saveAuthToken(AuthTokenEntity token);

  /// Clear all auth data
  Future<void> clearAuthData();

  /// Refresh authentication token
  Future<DataState<AuthTokenEntity>> refreshToken();
}
