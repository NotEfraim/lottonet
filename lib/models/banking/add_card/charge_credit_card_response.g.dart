// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charge_credit_card_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChargeCreditCardResponse _$ChargeCreditCardResponseFromJson(
        Map<String, dynamic> json) =>
    ChargeCreditCardResponse(
      json['message'] as String?,
      (json['result'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ChargeCreditCardResponseToJson(
        ChargeCreditCardResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'message': instance.message,
    };
