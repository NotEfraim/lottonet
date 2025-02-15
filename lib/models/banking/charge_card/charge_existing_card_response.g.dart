// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charge_existing_card_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChargeExistingCardResponse _$ChargeExistingCardResponseFromJson(
        Map<String, dynamic> json) =>
    ChargeExistingCardResponse(
      json['message'] as String?,
      (json['result'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ChargeExistingCardResponseToJson(
        ChargeExistingCardResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'message': instance.message,
    };
