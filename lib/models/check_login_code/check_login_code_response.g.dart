// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_login_code_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckLoginCodeResponse _$CheckLoginCodeResponseFromJson(
        Map<String, dynamic> json) =>
    CheckLoginCodeResponse(
      json['message'] as String?,
      (json['result'] as num).toInt(),
    );

Map<String, dynamic> _$CheckLoginCodeResponseToJson(
        CheckLoginCodeResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'message': instance.message,
    };
