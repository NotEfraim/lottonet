import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse {
  final int result;
  final String? message;

  BaseResponse(this.message, this.result);
}
