import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/domain/usecases/register_usecase.dart';
import '../../features/auth/presentation/bussiness_logic/bloc/auth_bloc/auth_bloc.dart';
import '../../features/auth/presentation/bussiness_logic/bloc/auth_bloc/auth_state.dart';
import '../../features/auth/presentation/bussiness_logic/bloc/signup_bloc/signup_bloc.dart';
import '../../features/auth/presentation/screen/login_screen.dart';
import '../../features/auth/presentation/screen/signup_screen.dart';
import '../../presentation/screen/homepage.dart';
import '../../service_locator.dart';

/// Helper class to make GoRouter listen to BLoC state changes
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

/// GoRouter configuration with authentication redirect
/// This is the main router instance that will be used throughout the app
class AppRouter {
  static AuthenticationBloc? _authBloc;
  static GoRouter? _router;

  /// Initialize the router with the authentication bloc
  static void initialize(AuthenticationBloc authBloc) {
    _authBloc = authBloc;
    _router = _createRouter();
  }

  /// Get the router instance
  static GoRouter get router {
    if (_router == null) {
      throw Exception(
        'AppRouter not initialized. Call AppRouter.initialize() first.',
      );
    }
    return _router!;
  }

  /// Create the GoRouter instance
  static GoRouter _createRouter() {
    if (_authBloc == null) {
      throw Exception('AuthenticationBloc not provided to AppRouter');
    }

    return GoRouter(
      debugLogDiagnostics: false, //Todo: Disable for production
      initialLocation: SplashScreen.routePath,

      /// Listen to authentication state changes to trigger redirects
      refreshListenable: GoRouterRefreshStream(_authBloc!.stream),

      /// Global redirect logic for authentication
      /// This function runs before every route to check if user is authenticated
      redirect: (BuildContext context, GoRouterState state) {
        final currentState = _authBloc!.state;

        final bool isAuthenticated =
            currentState is AuthenticationAuthenticated;
        final bool isLoading = currentState is AuthenticationLoading ||
            currentState is AuthenticationUninitialized;

        // If still loading or uninitialized, stay on splash
        if (isLoading) {
          return SplashScreen.routePath;
        } // Define public routes (no authentication required)
        final List<String> publicRoutes = [
          LoginScreen.routePath,
          SignupScreen.routePath,
          // Note: SplashScreen is not included here because it should redirect after loading
        ];

        final bool isPublicRoute = publicRoutes.contains(state.fullPath);

        // If user is not authenticated and trying to access protected route
        if (!isAuthenticated && !isPublicRoute) {
          return LoginScreen.routePath;
        }

        // If user is authenticated and on splash or trying to access login/signup
        if (isAuthenticated &&
            (state.fullPath == SplashScreen.routePath ||
                state.fullPath == LoginScreen.routePath ||
                state.fullPath == SignupScreen.routePath)) {
          return HomePage.routePath;
        }

        // No redirect needed
        return null;
      },

      /// Error page builder for unknown routes
      errorBuilder: (context, state) => ErrorPage(error: state.error),

      /// Route definitions
      routes: [
        /// Splash/Initial Route
        GoRoute(
          name: SplashScreen.routeName,
          path: SplashScreen.routePath,
          builder: (context, state) => const SplashScreen(),
        ),

        /// Authentication Routes
        GoRoute(
          name: LoginScreen.routeName,
          path: LoginScreen.routePath,
          builder: (context, state) => const LoginScreen(),
        ),

        GoRoute(
          name: SignupScreen.routeName,
          path: SignupScreen.routePath,
          builder: (context, state) => BlocProvider(
            create: (context) => SignupBloc(
              registerUseCase: locator.get<RegisterUseCase>(),
              authenticationBloc: locator.get<AuthenticationBloc>(),
            ),
            child: const SignupScreen(),
          ),
        ),

        /// Protected Routes (require authentication)
        GoRoute(
          name: HomePage.routeName,
          path: HomePage.routePath,
          builder: (context, state) => const HomePage(),
        ),
      ],
    );
  }
}

/// Splash Screen Widget
class SplashScreen extends StatelessWidget {
  static const String routeName = 'Splash';
  static const String routePath = '/';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 25.0,
              width: 25.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).colorScheme.primary,
                ),
                strokeWidth: 4.0,
              ),
            ),
            const SizedBox(height: 16),
            const Text('Loading...', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

/// Error Page Widget for unknown routes
class ErrorPage extends StatelessWidget {
  final Exception? error;

  const ErrorPage({super.key, this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Not Found'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go(HomePage.routePath),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            const Text(
              'Oops! Page not found',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              error?.toString() ??
                  'The page you are looking for does not exist.',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go(HomePage.routePath),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    );
  }
}
