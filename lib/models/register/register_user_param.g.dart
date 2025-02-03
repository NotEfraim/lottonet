// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_user_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterUserParam _$RegisterUserParamFromJson(Map<String, dynamic> json) =>
    RegisterUserParam(
      json['custId'] as String,
      json['firstName'] as String,
      json['lastName'] as String,
      (json['age'] as num).toInt(),
      json['mobile'] as String,
      json['password'] as String,
      json['uniqe_id'] as String,
    );

Map<String, dynamic> _$RegisterUserParamToJson(RegisterUserParam instance) =>
    <String, dynamic>{
      'custId': instance.custId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'age': instance.age,
      'mobile': instance.mobile,
      'password': instance.password,
      'uniqe_id': instance.uniqe_id,
    };
