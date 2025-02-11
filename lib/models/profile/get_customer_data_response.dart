import 'package:json_annotation/json_annotation.dart';
import 'package:lottonet/models/base_response.dart';

part 'get_customer_data_response.g.dart';

@JsonSerializable()
class GetCustomerDataResponse extends BaseResponse {
  final String? firstName;
  final String? lastName;
  final String? custId;
  final String? mobile;
  final int? age;
  GetCustomerDataResponse(super.message, super.result, this.firstName,
      this.lastName, this.custId, this.mobile, this.age);

  factory GetCustomerDataResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCustomerDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCustomerDataResponseToJson(this);
}
