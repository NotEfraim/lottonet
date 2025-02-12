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
      json['fullName'] as String?,
      json['custId'] as String?,
      json['mobile'] as String?,
      (json['age'] as num?)?.toInt(),
      (json['balance'] as num?)?.toInt(),
      json['email'] as String?,
    );

Map<String, dynamic> _$GetCustomerDataResponseToJson(
        GetCustomerDataResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'message': instance.message,
      'fullName': instance.fullName,
      'custId': instance.custId,
      'mobile': instance.mobile,
      'age': instance.age,
      'balance': instance.balance,
      'email': instance.email,
    };
