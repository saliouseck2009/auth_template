import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class AppStarted extends AuthenticationEvent {
  @override
  List<Object?> get props => [];
}

class LoggedIn extends AuthenticationEvent {
  final String? token;
  final String? userId;

  const LoggedIn({required this.token, required this.userId});

  @override
  List<Object?> get props => [token, userId];

  @override
  String toString() => 'LoggedIn { token: $token, userId: $userId }';
}

class LoggedOut extends AuthenticationEvent {
  @override
  List<Object?> get props => [];
}
