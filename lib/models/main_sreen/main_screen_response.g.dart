// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_screen_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainScreenResponse _$MainScreenResponseFromJson(Map<String, dynamic> json) =>
    MainScreenResponse(
      json['message'] as String?,
      (json['result'] as num?)?.toInt(),
      (json['balance'] as num).toInt(),
      ScreenGameData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MainScreenResponseToJson(MainScreenResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'message': instance.message,
      'balance': instance.balance,
      'data': instance.data,
    };
