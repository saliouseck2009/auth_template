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
  // TODO: implement props
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
//       'SignupButtonPressed {
//         ${username==null?"":"username: "+username+"}",
//          phone: $phone,
//           email: $email,
//            chipId: $chipId
//             }';
// }




// class SignUpUsernameChanged extends SignUpEvent {
//   final String username;
//   SignUpUsernameChanged({this.username});
//   @override
//   List<Object> get props => [username];
// }

// class SignUpEmailChanged extends SignUpEvent {
//   final String email;
//   SignUpEmailChanged({this.email});
//   @override
//   List<Object> get props => [email];
// }

// class SignUpPasswordChanged extends SignUpEvent {
//   final String password;
//   SignUpPasswordChanged({this.password});
//   @override
//   List<Object> get props => [password];
// }

// class SignUpPhoneChanged extends SignUpEvent {
//   final String phone;
//   SignUpPhoneChanged({this.phone});
//   @override
//   List<Object> get props => [phone];
// }


