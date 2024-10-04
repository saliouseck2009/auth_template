import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyage/features/auth/data/repository/repositories.dart';
import '../bussiness_logic/bloc/auth_bloc/auth.dart';
import '../bussiness_logic/bloc/login_bloc/login.dart';
import 'login_form.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = "/login";
  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: context.read<UserRepository>(),
          );
        },
        child: LoginForm(),
      ),
    );
  }
}
