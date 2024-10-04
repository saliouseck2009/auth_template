import 'package:equatable/equatable.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();
}

class SignupButtonPressed extends SignupEvent {
  final String? username;
  final String email;
  final String password;
  final String? phone;

  const SignupButtonPressed({
    this.username,
    required this.email,
    required this.password,
    this.phone,
  });

  @override
  List<Object> get props => [];
  @override
  String toString() => """
  SignupButtonPressed {
    ${username == null ? "" : "username: $username"}
    ${"email: $email"}
    ${"password: $password"}
    ${phone == null ? "" : "phone: $phone"}
  }
  """;
}
