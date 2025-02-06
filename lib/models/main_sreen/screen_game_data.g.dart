// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screen_game_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScreenGameData _$ScreenGameDataFromJson(Map<String, dynamic> json) =>
    ScreenGameData(
      json['lottoDate'] as String?,
      (json['lottoID'] as num?)?.toInt(),
      (json['lottoPrise'] as num?)?.toInt(),
      json['chanceDate'] as String?,
      (json['chanceId'] as num?)?.toInt(),
      (json['chancePrise'] as num?)?.toInt(),
      json['date777'] as String?,
      (json['id777'] as num?)?.toInt(),
      (json['prise777'] as num?)?.toInt(),
      json['date123'] as String?,
      (json['id123'] as num?)?.toInt(),
      (json['prise123'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ScreenGameDataToJson(ScreenGameData instance) =>
    <String, dynamic>{
      'lottoDate': instance.lottoDate,
      'lottoID': instance.lottoID,
      'lottoPrise': instance.lottoPrise,
      'chanceDate': instance.chanceDate,
      'chanceId': instance.chanceId,
      'chancePrise': instance.chancePrise,
      'date777': instance.date777,
      'id777': instance.id777,
      'prise777': instance.prise777,
      'date123': instance.date123,
      'id123': instance.id123,
      'prise123': instance.prise123,
    };
