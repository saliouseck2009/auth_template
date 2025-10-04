import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/user_entity.dart';
import '../../../../domain/usecases/check_auth_status_usecase.dart';
import '../../../../domain/usecases/get_current_user_usecase.dart';
import '../../../../domain/usecases/logout_usecase.dart';
import 'auth.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final CheckAuthStatusUseCase checkAuthStatusUseCase;
  final LogoutUseCase logoutUseCase;
  final GetCurrentUserUseCase getCurrentUserUseCase;

  AuthenticationBloc({
    required this.checkAuthStatusUseCase,
    required this.logoutUseCase,
    required this.getCurrentUserUseCase,
  }) : super(AuthenticationUninitialized()) {
    on<AppStarted>((event, emit) => _appStarted(event, emit));
    on<LoggedIn>((event, emit) => _loggedIn(event, emit));
    on<LoggedOut>((event, emit) => _loggedOut(event, emit));
  }

  _appStarted(AppStarted event, Emitter<AuthenticationState> emit) async {
    emit(
      AuthenticationLoading(),
    ); // Emit loading state while checking authentication

    try {
      final bool hasValidToken = await checkAuthStatusUseCase(params: null);

      if (hasValidToken) {
        final UserEntity? currentUser = await getCurrentUserUseCase(
          params: null,
        );
        if (currentUser != null) {
          emit(AuthenticationAuthenticated(user: currentUser));
        } else {
          emit(AuthenticationUnauthenticated());
        }
      } else {
        emit(AuthenticationUnauthenticated());
      }
    } catch (e) {
      // In case of any error, default to unauthenticated
      emit(AuthenticationUnauthenticated());
    }
  }

  _loggedIn(LoggedIn event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    emit(AuthenticationAuthenticated(user: event.user));
  }

  _loggedOut(LoggedOut event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    try {
      await logoutUseCase(params: null);
      emit(AuthenticationUnauthenticated());
    } catch (e) {
      // Even if logout fails, consider user as unauthenticated
      emit(AuthenticationUnauthenticated());
    }
  }
}
