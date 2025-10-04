import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../service_locator.dart';
import '../../domain/usecases/register_usecase.dart';
import '../bussiness_logic/bloc/auth_bloc/auth_bloc.dart';
import '../bussiness_logic/bloc/signup_bloc/signup_bloc.dart';
import 'signup_form.dart';

class SignupScreen extends StatelessWidget {
  static const String routeName = 'Signup';
  static const String routePath = '/signup';

  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SignupBloc(
          registerUseCase: locator.get<RegisterUseCase>(),
          authenticationBloc: locator.get<AuthenticationBloc>(),
        ),
        child: SignupForm(
          // userRepository: context.read<UserRepository>(),
        ),
      ),
    );
  }
}
