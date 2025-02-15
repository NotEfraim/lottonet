import 'package:json_annotation/json_annotation.dart';

part 'charge_existing_card_param.g.dart';

@JsonSerializable()
class ChargeExistingCardParam {
  final String lastdigits;
  final int amount;

  ChargeExistingCardParam({
    required this.lastdigits,
    required this.amount,
  });

  factory ChargeExistingCardParam.fromJson(Map<String, dynamic> json) =>
      _$ChargeExistingCardParamFromJson(json);

  Map<String, dynamic> toJson() => _$ChargeExistingCardParamToJson(this);
}
