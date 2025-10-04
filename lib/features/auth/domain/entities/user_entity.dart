import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String username;
  final String email;
  final String? phone;
  final String? token;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const UserEntity({
    required this.id,
    required this.username,
    required this.email,
    this.phone,
    this.token,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
    id,
    username,
    email,
    phone,
    token,
    createdAt,
    updatedAt,
  ];
}
