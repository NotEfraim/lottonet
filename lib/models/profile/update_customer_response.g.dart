// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_customer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCustomerResponse _$UpdateCustomerResponseFromJson(
        Map<String, dynamic> json) =>
    UpdateCustomerResponse(
      json['message'] as String?,
      (json['result'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UpdateCustomerResponseToJson(
        UpdateCustomerResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'message': instance.message,
    };
