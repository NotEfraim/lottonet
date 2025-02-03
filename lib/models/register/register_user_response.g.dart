// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterUserResponse _$RegisterUserResponseFromJson(
        Map<String, dynamic> json) =>
    RegisterUserResponse(
      json['message'] as String?,
      (json['result'] as num).toInt(),
    );

Map<String, dynamic> _$RegisterUserResponseToJson(
        RegisterUserResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'message': instance.message,
    };
