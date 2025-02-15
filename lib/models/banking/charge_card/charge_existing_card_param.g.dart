// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charge_existing_card_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChargeExistingCardParam _$ChargeExistingCardParamFromJson(
        Map<String, dynamic> json) =>
    ChargeExistingCardParam(
      lastdigits: json['lastdigits'] as String,
      amount: (json['amount'] as num).toInt(),
    );

Map<String, dynamic> _$ChargeExistingCardParamToJson(
        ChargeExistingCardParam instance) =>
    <String, dynamic>{
      'lastdigits': instance.lastdigits,
      'amount': instance.amount,
    };
