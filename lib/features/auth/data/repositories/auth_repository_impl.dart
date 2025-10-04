

import '../../../../core/data_state/data_state.dart';
import '../../domain/entities/auth_token_entity.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/local/auth_local_data_source.dart';
import '../datasources/remote/auth_service.dart';
import '../models/auth_token_model.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService authService;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({
    required this.authService,
    required this.localDataSource,
  });

  @override
  Future<DataState<UserEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await authService.login(
        email: email,
        password: password,
      );

      if (response['success'] == true) {
        final userMap = response['user'] as Map<String, dynamic>;
        final tokenMap = response['token'] as Map<String, dynamic>;

        final user = UserModel.fromJson(userMap);
        final token = AuthTokenModel.fromJson(tokenMap);

        // Save user and token locally
        await localDataSource.saveUser(user);
        await localDataSource.saveAuthToken(token);

        return DataSuccess(user);
      } else {
        return const DataFailed('Login failed');
      }
    } catch (e) {
      return DataFailed('Login failed: ${e.toString()}');
    }
  }

  @override
  Future<DataState<UserEntity>> register({
    required String username,
    required String email,
    required String password,
    String? phone,
  }) async {
    try {
      final response = await authService.register(
        username: username,
        email: email,
        password: password,
        phone: phone,
      );

      if (response['success'] == true) {
        final userMap = response['user'] as Map<String, dynamic>;
        final tokenMap = response['token'] as Map<String, dynamic>;

        final user = UserModel.fromJson(userMap);
        final token = AuthTokenModel.fromJson(tokenMap);

        // Save user and token locally
        await localDataSource.saveUser(user);
        await localDataSource.saveAuthToken(token);

        return DataSuccess(user);
      } else {
        return const DataFailed('Registration failed');
      }
    } catch (e) {
      return DataFailed('Registration failed: ${e.toString()}');
    }
  }

  @override
  Future<DataState<void>> logout() async {
    try {
      await authService.logout();
      await localDataSource.clearAuthData();
      return const DataSuccess(null);
    } catch (e) {
      return DataFailed('Logout failed: ${e.toString()}');
    }
  }

  @override
  Future<bool> hasValidToken() async {
    return await localDataSource.hasValidToken();
  }

  @override
  Future<UserEntity?> getCurrentUser() async {
    return await localDataSource.getUser();
  }

  @override
  Future<void> saveUser(UserEntity user) async {
    final userModel = UserModel(
      id: user.id,
      username: user.username,
      email: user.email,
      phone: user.phone,
      token: user.token,
      createdAt: user.createdAt,
      updatedAt: user.updatedAt,
    );
    await localDataSource.saveUser(userModel);
  }

  @override
  Future<void> saveAuthToken(AuthTokenEntity token) async {
    final tokenModel = AuthTokenModel(
      accessToken: token.accessToken,
      refreshToken: token.refreshToken,
      tokenType: token.tokenType,
      expiresAt: token.expiresAt,
    );
    await localDataSource.saveAuthToken(tokenModel);
  }

  @override
  Future<void> clearAuthData() async {
    await localDataSource.clearAuthData();
  }

  @override
  Future<DataState<AuthTokenEntity>> refreshToken() async {
    try {
      final currentToken = await localDataSource.getAuthToken();
      if (currentToken == null || currentToken.refreshToken == null) {
        return const DataFailed('No refresh token available');
      }

      final response = await authService.refreshToken(
        currentToken.refreshToken!,
      );

      if (response['success'] == true) {
        final tokenMap = response['token'] as Map<String, dynamic>;
        final newToken = AuthTokenModel.fromJson(tokenMap);

        await localDataSource.saveAuthToken(newToken);
        return DataSuccess(newToken);
      } else {
        return const DataFailed('Token refresh failed');
      }
    } catch (e) {
      return DataFailed('Token refresh failed: ${e.toString()}');
    }
  }
}
