import 'package:json_annotation/json_annotation.dart';
import 'package:lottonet/models/base_response.dart';

part 'check_login_code_response.g.dart';

@JsonSerializable()
class CheckLoginCodeResponse extends BaseResponse {
  CheckLoginCodeResponse(super.message, super.result);

  factory CheckLoginCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckLoginCodeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CheckLoginCodeResponseToJson(this);
}
