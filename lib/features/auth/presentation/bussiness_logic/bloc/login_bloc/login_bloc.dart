import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../../../core/data_state/data_state.dart';
import '../../../../domain/usecases/login_usecase.dart';
import '../auth_bloc/auth_bloc.dart';
import '../auth_bloc/auth_event.dart';
import 'login.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({required this.loginUseCase, required this.authenticationBloc})
    : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) => _loginButtonPressed(event, emit));
  }

  _loginButtonPressed(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());

    // Validate input
    if (event.email == null || event.password == null) {
      emit(const LoginFailure(error: "Email and password are required"));
      return;
    }

    try {
      final result = await loginUseCase(
        params: LoginParams(email: event.email!, password: event.password!),
      );

      if (result is DataSuccess) {
        emit(LoginSuccess());

        // Trigger authentication state update
        authenticationBloc.add(LoggedIn(user: result.data!));
      } else if (result is DataFailed) {
        emit(LoginFailure(error: result.error ?? "Login failed"));
      }
    } catch (error) {
      emit(LoginFailure(error: error.toString()));
    }
  }
}
