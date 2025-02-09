import 'package:json_annotation/json_annotation.dart';
import 'package:lottonet/models/base_response.dart';

part 'register_user_response.g.dart';

@JsonSerializable()
class RegisterUserResponse extends BaseResponse {
  final String? token;
  RegisterUserResponse(super.message, super.result, this.token);

  factory RegisterUserResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterUserResponseToJson(this);
}
