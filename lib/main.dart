import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';


import 'bloc_observer.dart';
import 'core/config/theme/theme.dart';
import 'core/navigation/app_routes.dart';
import 'features/auth/presentation/bussiness_logic/bloc/auth_bloc/auth.dart';
import 'service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();

  // Initialize dependencies with GetIt
  await setupDependencies(
    'https://api.example.com',
  ); // Replace with your actual base URL

  // Initialize the router with the auth bloc
  AppRouter.initialize(locator.get<AuthenticationBloc>());

  await initializeDateFormatting("fr_FR");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>.value(
          value: locator.get<AuthenticationBloc>()..add(AppStarted()),
        ),
      ],
      child: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          // GoRouter will automatically handle navigation based on auth state
          // through the redirect logic we implemented
          debugPrint('Auth state changed: ${state.runtimeType}');
        },
        child: Builder(
          builder: (context) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'LAMN App',
              theme: MaterialTheme().light(),
              // Use the GoRouter configuration
              routerConfig: AppRouter.router,
            );
          },
        ),
      ),
    );
  }
}
