import 'package:json_annotation/json_annotation.dart';
import 'package:lottonet/models/base_response.dart';
part 'update_customer_response.g.dart';

@JsonSerializable()
class UpdateCustomerResponse extends BaseResponse {
  UpdateCustomerResponse(super.message, super.result);

  factory UpdateCustomerResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateCustomerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCustomerResponseToJson(this);
}
