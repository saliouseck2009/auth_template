import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyage/features/auth/data/repository/repositories.dart';
import 'package:voyage/main.dart';
import 'features/auth/presentation/bussiness_logic/bloc/signup_bloc/signup_bloc.dart';
import 'features/auth/presentation/screen/login_screen.dart';
import 'features/auth/presentation/screen/signup_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case SignupScreen.routeName:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => SignupBloc(
                      userRepository: context.read<UserRepository>()),
                  child: SignupScreen(),
                ));

      case MainPage.routeName:
        return MaterialPageRoute(builder: (_) => const MainPage());

      default:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Erreur lors du rechargement de la page.'),
        ),
      );
    });
  }
}
