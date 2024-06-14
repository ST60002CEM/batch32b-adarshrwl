import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? id;
  final String email;
  final String username;
  final String phone;
  final String password;
  final String accountType;

  const AuthEntity({
    this.id,
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
    required this.accountType,
  });

  @override
  List<Object?> get props => [id, email, phone, username, password];
}
