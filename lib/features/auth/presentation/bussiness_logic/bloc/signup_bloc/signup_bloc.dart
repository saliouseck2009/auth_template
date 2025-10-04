import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/data_state/data_state.dart';
import '../../../../domain/usecases/register_usecase.dart';
import 'signup_event.dart';
import 'signup_state.dart';
import '../auth_bloc/auth_bloc.dart';
import '../auth_bloc/auth_event.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final RegisterUseCase registerUseCase;
  final AuthenticationBloc authenticationBloc;

  SignupBloc({required this.registerUseCase, required this.authenticationBloc})
    : super(SignupInitial()) {
    on<SignupButtonPressed>((event, emit) => _signupButtonPressed(event, emit));
  }

  _signupButtonPressed(
    SignupButtonPressed event,
    Emitter<SignupState> emit,
  ) async {
    emit(SignupLoading());

    // Validate required input
    if (event.email.isEmpty || event.password.isEmpty) {
      emit(const SignupFailure(error: "Email and password are required"));
      return;
    }

    try {
      final result = await registerUseCase(
        params: RegisterParams(
          username: event.username ?? '',
          email: event.email,
          password: event.password,
          phone: event.phone ?? '',
        ),
      );

      if (result is DataSuccess) {
        emit(const SignupSuccess(reponse: "Registration successful"));

        // Trigger authentication state update
        authenticationBloc.add(LoggedIn(user: result.data!));
      } else if (result is DataFailed) {
        emit(SignupFailure(error: result.error ?? "Registration failed"));
      }
    } catch (error) {
      emit(SignupFailure(error: error.toString()));
    }
  }
}
