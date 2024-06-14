import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:snapdwell/app/constants/hive_table_constant.dart';
import 'package:snapdwell/features/auth/domain/entity/auth_entity.dart';
import 'package:uuid/uuid.dart';

part 'auth_hive_model.g.dart';

final authHiveModelProvider = Provider(
      (ref) => AuthHiveModel.empty(),
);

@HiveType(typeId: HiveTableConstant.userTableId)
class AuthHiveModel {
  @HiveField(0)
  final String userId;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final String username;

  @HiveField(3)
  final String phone;

  @HiveField(4)
  final String password;

  // Constructor
  AuthHiveModel({
    String? userId,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
  }) : userId = userId ?? const Uuid().v4();

  // empty constructor
  AuthHiveModel.empty()
      : this(
    userId: '',
    email: '',
    phone: '',
    username: '',
    password: '',
  );

  // Convert Hive Object to Entity
  AuthEntity toEntity() => AuthEntity(
    id: userId,
    email: email,
    phone: phone,
    username: username,
    password: password,
  );

  // Convert Entity to Hive Object
  AuthHiveModel toHiveModel(AuthEntity entity) => AuthHiveModel(
    userId: const Uuid().v4(),
    email: entity.email,
    phone: entity.phone,
    username: entity.username,
    password: entity.password,
  );

  // Convert Entity List to Hive List
  List<AuthHiveModel> toHiveModelList(List<AuthEntity> entities) =>
      entities.map((entity) => toHiveModel(entity)).toList();

  @override
  String toString() {
    return 'userId: $userId, email:$email, phone: $phone, username: $username, password: $password';
  }
}
