import 'package:json_annotation/json_annotation.dart';
import 'package:lottonet/models/base_response.dart';

part 'register_user_response.g.dart';

@JsonSerializable()
class RegisterUserResponse extends BaseResponse {
  RegisterUserResponse(super.message, super.result);

  factory RegisterUserResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterUserResponseToJson(this);
}
