// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loading_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadingResponse _$LoadingResponseFromJson(Map<String, dynamic> json) =>
    LoadingResponse(
      json['message'] as String?,
      (json['result'] as num?)?.toInt(),
      json['token'] as String?,
    );

Map<String, dynamic> _$LoadingResponseToJson(LoadingResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'message': instance.message,
      'token': instance.token,
    };
