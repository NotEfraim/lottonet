// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_credit_cards_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCreditCardsResponse _$GetCreditCardsResponseFromJson(
        Map<String, dynamic> json) =>
    GetCreditCardsResponse(
      result: (json['result'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => CardData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCreditCardsResponseToJson(
        GetCreditCardsResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'data': instance.data,
    };

CardData _$CardDataFromJson(Map<String, dynamic> json) => CardData(
      lastFourDigits: json['lastFourDigits'] as String,
    );

Map<String, dynamic> _$CardDataToJson(CardData instance) => <String, dynamic>{
      'lastFourDigits': instance.lastFourDigits,
    };
