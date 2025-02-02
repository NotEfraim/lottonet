// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_code_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendCodeParam _$SendCodeParamFromJson(Map<String, dynamic> json) =>
    SendCodeParam(
      uniqe_id: json['uniqe_id'] as String,
      mobile: json['mobile'] as String,
      custId: json['custId'] as String,
    );

Map<String, dynamic> _$SendCodeParamToJson(SendCodeParam instance) =>
    <String, dynamic>{
      'uniqe_id': instance.uniqe_id,
      'mobile': instance.mobile,
      'custId': instance.custId,
    };
