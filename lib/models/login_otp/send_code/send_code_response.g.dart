// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_code_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendCodeResponse _$SendCodeResponseFromJson(Map<String, dynamic> json) =>
    SendCodeResponse(
      json['message'] as String?,
      (json['result'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SendCodeResponseToJson(SendCodeResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'message': instance.message,
    };
