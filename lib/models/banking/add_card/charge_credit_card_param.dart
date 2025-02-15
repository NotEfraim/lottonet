import 'package:json_annotation/json_annotation.dart';

part 'charge_credit_card_param.g.dart';

@JsonSerializable()
class ChargeCreditCardParam {
  final String ownerId;
  final String ownerName;
  final String ownerCreditCard;
  final String month;
  final String year;
  final String cvv;
  final int amount;
  final int toSave; // 1 = Save card, 0 = Do not save

  ChargeCreditCardParam({
    required this.ownerId,
    required this.ownerName,
    required this.ownerCreditCard,
    required this.month,
    required this.year,
    required this.cvv,
    required this.amount,
    required this.toSave,
  });

  factory ChargeCreditCardParam.fromJson(Map<String, dynamic> json) =>
      _$ChargeCreditCardParamFromJson(json);

  Map<String, dynamic> toJson() => _$ChargeCreditCardParamToJson(this);
}
