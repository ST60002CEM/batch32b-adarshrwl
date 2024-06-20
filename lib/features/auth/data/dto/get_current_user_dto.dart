import 'package:json_annotation/json_annotation.dart';
import 'package:snapdwell/features/auth/domain/entity/auth_entity.dart';

part 'get_current_user_dto.g.dart';

@JsonSerializable()
class GetCurrentUserDto {
  @JsonKey(name: '_id')
  final String id;
  final String email;
  final String username;
  final String phone;
  final String password;
  final String accountType;

  GetCurrentUserDto({
    required this.id,
    required this.email,
    required this.username,
    required this.phone,
    required this.password,
    required this.accountType,
  });

  AuthEntity toEntity() {
    return AuthEntity(
        username: username,
        email: email,
        phone: phone,
        password: '',
        accountType: accountType);
  }

  factory GetCurrentUserDto.fromJson(Map<String, dynamic> json) =>
      _$GetCurrentUserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetCurrentUserDtoToJson(this);
}
