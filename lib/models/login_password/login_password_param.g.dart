// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_password_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginPasswordParam _$LoginPasswordParamFromJson(Map<String, dynamic> json) =>
    LoginPasswordParam(
      custId: json['custId'] as String,
      password: json['password'] as String,
      uniqe_id: json['uniqe_id'] as String,
    );

Map<String, dynamic> _$LoginPasswordParamToJson(LoginPasswordParam instance) =>
    <String, dynamic>{
      'custId': instance.custId,
      'password': instance.password,
      'uniqe_id': instance.uniqe_id,
    };
