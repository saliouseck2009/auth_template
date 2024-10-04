import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyage/features/auth/presentation/widgets/utils_screen.dart';
import 'package:voyage/main.dart';

import '../../../../shared/widgets/loading_widget.dart';
import '../bussiness_logic/bloc/login_bloc/login.dart';
import '../bussiness_logic/bloc/signup_bloc/signup_bloc.dart';
import '../../data/repository/repositories.dart';
import '../widgets/custom_text_form_field.dart';
import 'signup_screen.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> _formKeySignIn = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginForm({super.key});

  _onLoginButtonPressed(
      {required BuildContext context, required GlobalKey<FormState> key}) {
    if (key.currentState!.validate()) {
      BlocProvider.of<LoginBloc>(context).add(
        LoginButtonPressed(
          email: _usernameController.text,
          password: _passwordController.text,
        ),
      );
    }
  }

  Widget loginButton(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            )),
        onPressed: () =>
            _onLoginButtonPressed(key: _formKeySignIn, context: context),
        child: const Text("Se Connecter",
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white)));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            UtilsScreen.customSnackbar(
              context: context,
              description: state.error,
              colorBackground: Theme.of(context).colorScheme.error,
              textType: 'Error',
            );
          } else if (state is LoginSuccess) {
            UtilsScreen.customSnackbar(
              context: context,
              description: "User connecté avec succés",
              colorBackground: Theme.of(context).colorScheme.primary,
              textType: 'Success',
            );
            Navigator.pushReplacementNamed(context, MainPage.routeName);
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
          child: Form(
            key: _formKeySignIn,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Image(
                    //   fit: BoxFit.fill,
                    //   image: AssetImage('assets/images/DaaraScience.png'),
                    // ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "This is login message",
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Theme.of(context).colorScheme.primary),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                CustomTextFormField(
                  icon: Icon(Icons.person,
                      color: Theme.of(context).colorScheme.primary),
                  keyboardType: TextInputType.text,
                  label: "Username",
                  controller: _usernameController,
                  textInputAction: TextInputAction.next,
                  validator: (valueInput) {
                    if (valueInput!.isEmpty) {
                      return 'Veillez entrer votre Pseudonyme';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CustomTextFormField(
                  icon: Icon(Icons.lock_outline,
                      color: Theme.of(context).colorScheme.primary),
                  keyboardType: TextInputType.visiblePassword,
                  label: "Mot de Passe",
                  controller: _passwordController,
                  textInputAction: TextInputAction.next,
                  obscureText: true,
                  validator: (valueInput) {
                    if (valueInput!.isEmpty) {
                      return 'Veillez entrer votre mot de passe';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                      child: const Text(
                        "Forget password?",
                        style: TextStyle(color: Colors.black45, fontSize: 12.0),
                      ),
                      onTap: () {}),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          return SizedBox(
                              height: 45,
                              child: state is LoginLoading
                                  ? const LoadingWidget()
                                  : loginButton(context));
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Don't have an account?",
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onBackground
                                    .withOpacity(0.4)),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 5.0),
                          ),
                          GestureDetector(
                              onTap: () {
                                //Navigator.of(context).pushNamed('/signup');
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (_) {
                                  return BlocProvider(
                                    create: (context) => SignupBloc(
                                        userRepository:
                                            context.read<UserRepository>()),
                                    child: const SignupScreen(),
                                  );
                                }));
                              },
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      )),
                ),
                const SizedBox(
                  height: 20.0,
                )
              ],
            ),
          ),
        ));
  }
}
