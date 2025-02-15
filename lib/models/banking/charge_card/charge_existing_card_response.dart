import 'package:json_annotation/json_annotation.dart';
import 'package:lottonet/models/base_response.dart';

part 'charge_existing_card_response.g.dart';

@JsonSerializable()
class ChargeExistingCardResponse extends BaseResponse {
  ChargeExistingCardResponse(super.message, super.result);

  factory ChargeExistingCardResponse.fromJson(Map<String, dynamic> json) =>
      _$ChargeExistingCardResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChargeExistingCardResponseToJson(this);
}
