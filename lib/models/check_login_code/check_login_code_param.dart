import 'package:json_annotation/json_annotation.dart';

part 'check_login_code_param.g.dart';

@JsonSerializable()
class CheckLoginCodeParam {
  final String mobile;
  final String code;
  final String uniqe_id;

  CheckLoginCodeParam(
      {required this.mobile, required this.code, required this.uniqe_id});

  factory CheckLoginCodeParam.fromJson(Map<String, dynamic> json) =>
      _$CheckLoginCodeParamFromJson(json);

  Map<String, dynamic> toJson() => _$CheckLoginCodeParamToJson(this);
}
