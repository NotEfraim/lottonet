import 'package:json_annotation/json_annotation.dart';

part 'send_code_param.g.dart';

@JsonSerializable()
class SendCodeParam {
  final String uniqe_id;
  final String mobile;
  final String custId;

  SendCodeParam(
      {required this.uniqe_id, required this.mobile, required this.custId});

  factory SendCodeParam.fromJson(Map<String, dynamic> json) =>
      _$SendCodeParamFromJson(json);

  Map<String, dynamic> toJson() => _$SendCodeParamToJson(this);
}
