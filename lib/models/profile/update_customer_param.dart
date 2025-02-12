import 'package:json_annotation/json_annotation.dart';

part 'update_customer_param.g.dart';

@JsonSerializable()
class UpdateCustomerParam {
  final String fullName;
  final String custId;
  final String mobile;
  final int age;
  final String email;

  UpdateCustomerParam(
      {required this.fullName,
      required this.custId,
      required this.mobile,
      required this.age,
      required this.email});

  factory UpdateCustomerParam.fromJson(Map<String, dynamic> json) =>
      _$UpdateCustomerParamFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCustomerParamToJson(this);
}
