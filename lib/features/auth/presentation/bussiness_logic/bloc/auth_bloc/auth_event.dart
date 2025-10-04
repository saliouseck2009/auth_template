import 'package:equatable/equatable.dart';

import '../../../../domain/entities/user_entity.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class AppStarted extends AuthenticationEvent {
  @override
  List<Object?> get props => [];
}

class LoggedIn extends AuthenticationEvent {
  final UserEntity user;

  const LoggedIn({required this.user});

  @override
  List<Object?> get props => [user];

  @override
  String toString() => 'LoggedIn { user: $user }';
}

class LoggedOut extends AuthenticationEvent {
  @override
  List<Object?> get props => [];
}
