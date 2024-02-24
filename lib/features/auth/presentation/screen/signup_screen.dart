import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bussiness_logic/bloc/signup_bloc/signup.dart';
import '../../data/repository/repositories.dart';
import 'signup_form.dart';

class SignupScreen extends StatelessWidget {
  static const String routeName = '/signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return SignupBloc(
            userRepository: context.read<UserRepository>(),
          );
        },
        child: SignupForm(
            // userRepository: context.read<UserRepository>(),
            ),
      ),
    );
  }
}
