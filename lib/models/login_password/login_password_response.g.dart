// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_password_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginPasswordResponse _$LoginPasswordResponseFromJson(
        Map<String, dynamic> json) =>
    LoginPasswordResponse(
      json['message'] as String?,
      (json['result'] as num?)?.toInt(),
      json['token'] as String?,
    );

Map<String, dynamic> _$LoginPasswordResponseToJson(
        LoginPasswordResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'message': instance.message,
      'token': instance.token,
    };
