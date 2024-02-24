import 'dart:async';

import 'package:bloc/bloc.dart';
import '../../../../data/repository/repositories.dart';
import '../auth_bloc/auth_bloc.dart';
import 'login.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    required this.userRepository,
    required this.authenticationBloc,
  }) : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) => _loginButtonPressed(event, emit));
  }

  _loginButtonPressed(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    // try {
    //   throw Exception("Exception intentionnelle");
    // } catch (exception, stackTrace) {
    //   await Sentry.captureException(
    //     exception,
    //     stackTrace: stackTrace,
    //   );
    // }

    try {
      await Future.delayed(const Duration(seconds: 1));
      if (event.email == "saliou@seck.com" && event.password == "toor") {
        emit(LoginSuccess());
      } else {
        emit(const LoginFailure(error: "Cet utilisateur n'existe"));
      }
      // final data = await userRepository.login(
      //   event.email!,
      //   event.password!,
      // );
      // authenticationBloc
      //     .add(LoggedIn(token: data['token'], userId: data['userId']));
      // locator.get<UserInfo>().setId = data['userId']!;
      // locator.get<UserInfo>().setToken = data['token']!;
    } catch (error) {
      emit(const LoginFailure(error: "Erreur de connexion"));
      rethrow;
    }
  }
}
