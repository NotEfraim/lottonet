// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charge_credit_card_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChargeCreditCardParam _$ChargeCreditCardParamFromJson(
        Map<String, dynamic> json) =>
    ChargeCreditCardParam(
      ownerId: json['ownerId'] as String,
      ownerName: json['ownerName'] as String,
      ownerCreditCard: json['ownerCreditCard'] as String,
      month: json['month'] as String,
      year: json['year'] as String,
      cvv: json['cvv'] as String,
      amount: (json['amount'] as num).toInt(),
      toSave: (json['toSave'] as num).toInt(),
    );

Map<String, dynamic> _$ChargeCreditCardParamToJson(
        ChargeCreditCardParam instance) =>
    <String, dynamic>{
      'ownerId': instance.ownerId,
      'ownerName': instance.ownerName,
      'ownerCreditCard': instance.ownerCreditCard,
      'month': instance.month,
      'year': instance.year,
      'cvv': instance.cvv,
      'amount': instance.amount,
      'toSave': instance.toSave,
    };
