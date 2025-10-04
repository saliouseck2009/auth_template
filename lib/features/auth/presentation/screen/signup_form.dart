import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyage/core/helpers/extensions/extension.dart';
import '../bussiness_logic/bloc/signup_bloc/signup.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/utils_screen.dart';

class SignupForm extends StatelessWidget {
  SignupForm({super.key});
  final _formKeySignUp = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  _onSignupButtonPressed({
    required BuildContext context,
    required GlobalKey<FormState> key,
  }) {
    log("TRIGGERED");
    if (key.currentState!.validate()) {
      BlocProvider.of<SignupBloc>(context).add(
        SignupButtonPressed(
          email: _emailController.text,
          password: _passwordController.text,
          username: _usernameController.text,
          phone: _phoneController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupBloc, SignupState>(
      listener: (context, state) {
        if (state is SignupFailure) {
          UtilsScreen.customSnackbar(
            context: context,
            description: state.error,
            colorBackground: Theme.of(context).colorScheme.error,
            textType: 'Error',
          );
        } else if (state is SignupSuccess) {
          Navigator.pop(context);
          UtilsScreen.customSnackbar(
            context: context,
            description: "incription effectuée avec succés",
            colorBackground: Theme.of(context).colorScheme.primary,
            textType: 'Succes',
          );
        }
      },
      child: BlocBuilder<SignupBloc, SignupState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
            child: Form(
              key: _formKeySignUp,
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
                      const SizedBox(height: 5.0),
                      Text(
                        "Connectez - vous",
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30.0),
                  CustomTextFormField(
                    icon: Icon(
                      Icons.email,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    keyboardType: TextInputType.text,
                    label: "Email",
                    controller: _emailController,
                    textInputAction: TextInputAction.next,
                    validator: (valueInput) {
                      if (valueInput!.isEmpty) {
                        return 'Veillez entrer votre email';
                      } else if (!valueInput.isEmail) {
                        return 'Veillez saisir un Email valide';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  //_passwordTextFormField(),
                  CustomTextFormField(
                    icon: Icon(
                      Icons.lock_outline,
                      color: Theme.of(context).colorScheme.primary,
                    ),
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
                  const SizedBox(height: 20.0),
                  // _phoneTextFormField(),
                  CustomTextFormField(
                    icon: Icon(
                      Icons.phone,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    keyboardType: TextInputType.number,
                    label: "Téléphone",
                    controller: _phoneController,
                    textInputAction: TextInputAction.done,
                    validator: (valueInput) {
                      if (valueInput!.isEmpty) {
                        return 'Veillez entrer votre numéro de téléphone';
                      } else if (!valueInput.isPhoneNumber) {
                        return 'Veillez saisir un numéro de téléphone valide';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30.0),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(
                          height: 45,
                          child: state is SignupLoading
                              ? const CircularProgressIndicator.adaptive()
                              : ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                  onPressed: () => _onSignupButtonPressed(
                                    key: _formKeySignUp,
                                    context: context,
                                  ),
                                  child: const Text(
                                    "Creer un compte",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurface.withValues(alpha: .4),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(right: 5.0)),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Connexion",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
