import 'package:json_annotation/json_annotation.dart';
import 'package:lottonet/models/base_response.dart';

part 'send_code_response.g.dart';

@JsonSerializable()
class SendCodeResponse extends BaseResponse {
  SendCodeResponse(super.message, super.result);

  factory SendCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$SendCodeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SendCodeResponseToJson(this);
}
