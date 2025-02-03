import 'package:json_annotation/json_annotation.dart';

part 'register_user_param.g.dart';

@JsonSerializable()
class RegisterUserParam {
  final String custId;
  final String firstName;
  final String lastName;
  final int age;
  final String mobile;
  final String password;
  final String uniqe_id;

  RegisterUserParam(this.custId, this.firstName, this.lastName, this.age,
      this.mobile, this.password, this.uniqe_id);

  factory RegisterUserParam.fromJson(Map<String, dynamic> json) =>
      _$RegisterUserParamFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterUserParamToJson(this);
}
