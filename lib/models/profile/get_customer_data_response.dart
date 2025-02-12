import 'package:json_annotation/json_annotation.dart';
import 'package:lottonet/models/base_response.dart';

part 'get_customer_data_response.g.dart';

@JsonSerializable()
class GetCustomerDataResponse extends BaseResponse {
  final String? fullName;
  final String? custId;
  final String? mobile;
  final int? age;
  final int? balance;
  final String? email;
  GetCustomerDataResponse(super.message, super.result, this.fullName,
      this.custId, this.mobile, this.age, this.balance, this.email);

  factory GetCustomerDataResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCustomerDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCustomerDataResponseToJson(this);
}
