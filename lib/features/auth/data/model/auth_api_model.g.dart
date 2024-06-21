// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthApiModel _$AuthApiModelFromJson(Map<String, dynamic> json) => AuthApiModel(
      id: json['_id'] as String,
      email: json['email'] as String,
      username: json['username'] as String,
      phone: json['phone'] as String,
      password: json['password'] as String?,
      accountType: json['accountType'] as String,
    );

Map<String, dynamic> _$AuthApiModelToJson(AuthApiModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'phone': instance.phone,
      'password': instance.password,
      'accountType': instance.accountType,
    };
