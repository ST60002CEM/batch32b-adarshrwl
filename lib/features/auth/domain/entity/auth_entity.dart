import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? id;
  final String email;
  final String username;
  final String firstname;
  final String lastname;
  final String password;
  final String accountType;

  const AuthEntity({
    this.id,
    required this.username,
    required this.email,
    required this.firstname,
    required this.lastname,

    required this.password,
    required this.accountType,
  });

  @override
  List<Object?> get props => [id, email, firstname,lastname, username, password,accountType];
}
