// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_customer_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCustomerParam _$UpdateCustomerParamFromJson(Map<String, dynamic> json) =>
    UpdateCustomerParam(
      fullName: json['fullName'] as String,
      custId: json['custId'] as String,
      mobile: json['mobile'] as String,
      age: (json['age'] as num).toInt(),
      email: json['email'] as String,
    );

Map<String, dynamic> _$UpdateCustomerParamToJson(
        UpdateCustomerParam instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'custId': instance.custId,
      'mobile': instance.mobile,
      'age': instance.age,
      'email': instance.email,
    };
