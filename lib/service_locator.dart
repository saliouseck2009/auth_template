import 'package:get_it/get_it.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'core/config/db/shared_preferences/secure_storage.dart';
import 'core/config/network/dio_config.dart';
import 'core/config/network/networking_service.dart';
import 'data/datasources/local/database.dart';
import 'features/auth/data/datasources/local/auth_local_data_source.dart';
import 'features/auth/data/datasources/remote/auth_service.dart';
import 'features/auth/data/datasources/remote/auth_service.dart' as auth_remote;
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/domain/usecases/check_auth_status_usecase.dart';
import 'features/auth/domain/usecases/get_current_user_usecase.dart';
import 'features/auth/domain/usecases/login_usecase.dart';
import 'features/auth/domain/usecases/logout_usecase.dart';
import 'features/auth/domain/usecases/register_usecase.dart';
import 'features/auth/presentation/bussiness_logic/bloc/auth_bloc/auth_bloc.dart';

final locator = GetIt.instance;

Future<void> setupDependencies(baseUrl) async {
  final databaseHelper = DatabaseHelper();

  locator.registerSingletonAsync<DatabaseHelper>(() async => databaseHelper);

  await locator.isReady<DatabaseHelper>();

  // 3. Enregistrer notre service de networking dans GetIt
  locator.registerSingleton<NetworkingService>(
    NetworkingService(
      dio: DioConfig.getDio(baseUrl),
      prefs: SecureStorage.instance,
    ),
  );

  locator.registerSingleton<AuthService>(
    AuthService(),
  );

  // ============= AUTH FEATURE DEPENDENCIES =============

  // Register FlutterSecureStorage
  locator.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );

  // Auth Data Sources
  locator.registerLazySingleton<auth_remote.AuthService>(
    () => auth_remote.AuthService(),
  );

  locator.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(storage: locator<FlutterSecureStorage>()),
  );

  // Auth Repository
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authService: locator<auth_remote.AuthService>(),
      localDataSource: locator<AuthLocalDataSource>(),
    ),
  );

  // Auth Use Cases
  locator.registerLazySingleton<CheckAuthStatusUseCase>(
    () => CheckAuthStatusUseCase(locator<AuthRepository>()),
  );

  locator.registerLazySingleton<GetCurrentUserUseCase>(
    () => GetCurrentUserUseCase(locator<AuthRepository>()),
  );

  locator.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(locator<AuthRepository>()),
  );

  locator.registerLazySingleton<LogoutUseCase>(
    () => LogoutUseCase(locator<AuthRepository>()),
  );

  locator.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(locator<AuthRepository>()),
  );

  // Auth BLoCs
  locator.registerLazySingleton<AuthenticationBloc>(
    () => AuthenticationBloc(
      checkAuthStatusUseCase: locator<CheckAuthStatusUseCase>(),
      logoutUseCase: locator<LogoutUseCase>(),
      getCurrentUserUseCase: locator<GetCurrentUserUseCase>(),
    ),
  );
}
