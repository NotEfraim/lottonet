import 'package:json_annotation/json_annotation.dart';
import 'package:lottonet/models/base_response.dart';

part 'loading_response.g.dart';

@JsonSerializable()
class LoadingResponse extends BaseResponse{
  final String? token;
  LoadingResponse(super.message, super.result, this.token);

  factory LoadingResponse.fromJson(Map<String, dynamic> json) => _$LoadingResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoadingResponseToJson(this);
}