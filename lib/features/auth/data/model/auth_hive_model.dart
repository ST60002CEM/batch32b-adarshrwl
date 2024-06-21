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
  final String firstname;

  @HiveField(4)
  final String lastname;

  @HiveField(5)
  final String password;

  @HiveField(6)
  final String accountType;

  // Constructor
  AuthHiveModel({
    String? userId,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.username,
    required this.password,
    required  this.accountType,
  }) : userId = userId ?? const Uuid().v4();

  // empty constructor
  AuthHiveModel.empty()
      : this(
    userId: '',
    email: '',
    firstname: '',
    lastname: '',
    username: '',
    password: '',
    accountType: '',
  );

  // Convert Hive Object to Entity
  AuthEntity toEntity() => AuthEntity(
    id: userId,
    email: email,
    firstname: firstname,
    lastname: lastname,
    username: username,
    password: password, accountType: accountType,
    
  );

  // Convert Entity to Hive Object
  AuthHiveModel toHiveModel(AuthEntity entity) => AuthHiveModel(
    userId: const Uuid().v4(),
    email: entity.email,
    firstname: entity.firstname,
    lastname: entity.lastname,
    username: entity.username,
    password: entity.password, accountType:entity.accountType,
  );

  // Convert Entity List to Hive List
  List<AuthHiveModel> toHiveModelList(List<AuthEntity> entities) =>
      entities.map((entity) => toHiveModel(entity)).toList();

  @override
  String toString() {
    return 'userId: $userId, email:$email, firsname: $firstname, lastname:$lastname, username: $username, password: $password, accountType: $accountType';
  }
}
