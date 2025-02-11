// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_customer_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCustomerDataResponse _$GetCustomerDataResponseFromJson(
        Map<String, dynamic> json) =>
    GetCustomerDataResponse(
      json['message'] as String?,
      (json['result'] as num?)?.toInt(),
      json['firstName'] as String?,
      json['lastName'] as String?,
      json['custId'] as String?,
      json['mobile'] as String?,
      (json['age'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GetCustomerDataResponseToJson(
        GetCustomerDataResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'message': instance.message,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'custId': instance.custId,
      'mobile': instance.mobile,
      'age': instance.age,
    };
