import 'package:json_annotation/json_annotation.dart';

part 'get_credit_cards_response.g.dart';

@JsonSerializable()
class GetCreditCardsResponse {
  final int result;
  final List<CardData> data;

  GetCreditCardsResponse({
    required this.result,
    required this.data,
  });

  factory GetCreditCardsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCreditCardsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCreditCardsResponseToJson(this);
}

@JsonSerializable()
class CardData {
  final String lastFourDigits;

  CardData({required this.lastFourDigits});

  factory CardData.fromJson(Map<String, dynamic> json) =>
      _$CardDataFromJson(json);

  Map<String, dynamic> toJson() => _$CardDataToJson(this);
}
