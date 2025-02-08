// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_login_code_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckLoginCodeParam _$CheckLoginCodeParamFromJson(Map<String, dynamic> json) =>
    CheckLoginCodeParam(
      mobile: json['mobile'] as String,
      code: json['code'] as String?,
      uniqe_id: json['uniqe_id'] as String,
    );

Map<String, dynamic> _$CheckLoginCodeParamToJson(
        CheckLoginCodeParam instance) =>
    <String, dynamic>{
      'mobile': instance.mobile,
      'code': instance.code,
      'uniqe_id': instance.uniqe_id,
    };
