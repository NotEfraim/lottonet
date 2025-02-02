import 'package:json_annotation/json_annotation.dart';

part 'login_password_param.g.dart';

@JsonSerializable()
class LoginPasswordParam {
  final String custId;
  final String password;
  final String uniqe_id;

  LoginPasswordParam(
      {required this.custId, required this.password, required this.uniqe_id});

  factory LoginPasswordParam.fromJson(Map<String, dynamic> json) =>
      _$LoginPasswordParamFromJson(json);

  Map<String, dynamic> toJson() => _$LoginPasswordParamToJson(this);
}
