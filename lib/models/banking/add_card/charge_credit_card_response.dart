import 'package:json_annotation/json_annotation.dart';
import 'package:lottonet/models/base_response.dart';

part 'charge_credit_card_response.g.dart';

@JsonSerializable()
class ChargeCreditCardResponse extends BaseResponse {
  ChargeCreditCardResponse(super.message, super.result);

  factory ChargeCreditCardResponse.fromJson(Map<String, dynamic> json) =>
      _$ChargeCreditCardResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChargeCreditCardResponseToJson(this);
}
