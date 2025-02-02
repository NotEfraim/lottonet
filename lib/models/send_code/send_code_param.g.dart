// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_code_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendCodeParam _$SendCodeParamFromJson(Map<String, dynamic> json) =>
    SendCodeParam(
      json['uniqe_id'] as String,
      mobileNumber: json['mobileNumber'] as String,
      custId: json['custId'] as String,
    );

Map<String, dynamic> _$SendCodeParamToJson(SendCodeParam instance) =>
    <String, dynamic>{
      'uniqe_id': instance.uniqe_id,
      'mobileNumber': instance.mobileNumber,
      'custId': instance.custId,
    };
