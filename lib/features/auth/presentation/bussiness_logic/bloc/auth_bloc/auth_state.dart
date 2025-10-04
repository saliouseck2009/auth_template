import 'package:equatable/equatable.dart';

import '../../../../domain/entities/user_entity.dart';

abstract class AuthenticationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthenticationUninitialized extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {
  final UserEntity user;

  AuthenticationAuthenticated({required this.user});

  @override
  List<Object?> get props => [user];
}

class AuthenticationUnauthenticated extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}
