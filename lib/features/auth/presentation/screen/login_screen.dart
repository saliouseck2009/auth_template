import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../service_locator.dart';
import '../../domain/usecases/login_usecase.dart';
import '../bussiness_logic/bloc/auth_bloc/auth_bloc.dart';
import '../bussiness_logic/bloc/login_bloc/login_bloc.dart';
import 'login_form.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = "Login";
  static const routePath = '/login';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginBloc(
          loginUseCase: locator.get<LoginUseCase>(),
          authenticationBloc: locator.get<AuthenticationBloc>(),
        ),
        child: LoginForm(),
      ),
    );
  }
}
