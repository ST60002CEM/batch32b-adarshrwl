import 'package:json_annotation/json_annotation.dart';
import 'package:snapdwell/features/auth/domain/entity/auth_entity.dart';
part 'auth_api_model.g.dart';

@JsonSerializable()
class AuthApiModel {
  @JsonKey(name: '_id')
  final String id;
  final String email;
  final String username;
  final String phone;
  final String? password;
  final String accountType;

  AuthApiModel({
    required this.id,
    required this.email,
    required this.username,
    required this.phone,
    required this.password,
    required this.accountType,
  });

  factory AuthApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);

  //To Entity
  AuthEntity toEntity() {
    return AuthEntity(
        username: username,
        email: email,
        phone: phone,
        password: password ?? '',
        accountType: accountType);
  }
}
