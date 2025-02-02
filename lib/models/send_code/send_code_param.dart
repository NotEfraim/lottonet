import 'package:json_annotation/json_annotation.dart';
import 'package:lottonet/models/base_param.dart';

part 'send_code_param.g.dart';

@JsonSerializable()
class SendCodeParam extends BaseParam {
  final String mobileNumber;
  final String custId;

  SendCodeParam(super.uniqe_id,
      {required this.mobileNumber, required this.custId});

  factory SendCodeParam.fromJson(Map<String, dynamic> json) =>
      _$SendCodeParamFromJson(json);

  Map<String, dynamic> toJson() => _$SendCodeParamToJson(this);
}
