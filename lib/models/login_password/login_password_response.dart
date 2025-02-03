import 'package:json_annotation/json_annotation.dart';
import 'package:lottonet/models/base_response.dart';

part 'login_password_response.g.dart';

@JsonSerializable()
class LoginPasswordResponse extends BaseResponse {
  final String? token;
  LoginPasswordResponse(super.message, super.result, this.token);

  factory LoginPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginPasswordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginPasswordResponseToJson(this);
}
