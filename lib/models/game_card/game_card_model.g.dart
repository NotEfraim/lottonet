// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameCardModel _$GameCardModelFromJson(Map<String, dynamic> json) =>
    GameCardModel(
      prize: json['prize'] as String?,
      day: json['day'] as String?,
      gameName: json['gameName'] as String?,
      duration: json['duration'] == null
          ? null
          : Duration(microseconds: (json['duration'] as num).toInt()),
    );

Map<String, dynamic> _$GameCardModelToJson(GameCardModel instance) =>
    <String, dynamic>{
      'prize': instance.prize,
      'day': instance.day,
      'gameName': instance.gameName,
      'duration': instance.duration?.inMicroseconds,
    };
