import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyage/features/auth/data/repository/repositories.dart';
import 'auth.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository = UserRepository();

  AuthenticationBloc() : super(AuthenticationUninitialized()) {
    on<AppStarted>((event, emit) => _appStarted(event, emit));
    on<LoggedIn>((event, emit) => _loggedIn(event, emit));
    on<LoggedOut>((event, emit) => _loggedOut(event, emit));
  }

  _appStarted(AppStarted event, Emitter<AuthenticationState> emit) async {
    final bool hasToken = await userRepository.hasToken();
    final bool hasUserId = await userRepository.hasUsersId();
    if (hasToken & hasUserId) {
      emit(AuthenticationAuthenticated());
    } else {
      emit(AuthenticationUnauthenticated());
    }
  }

  _loggedIn(LoggedIn event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    await userRepository.persistToken(event.token!);
    await userRepository.persistUserId(event.userId!);
    emit(AuthenticationAuthenticated());
  }

  _loggedOut(LoggedOut event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    await userRepository.deleteToken();
    await userRepository.deleteUserId();
    emit(AuthenticationUnauthenticated());
  }
}
