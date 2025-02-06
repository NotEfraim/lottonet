import 'package:json_annotation/json_annotation.dart';
import 'package:lottonet/models/base_response.dart';
import 'package:lottonet/models/main_sreen/screen_game_data.dart';

part 'main_screen_response.g.dart';

@JsonSerializable()
class MainScreenResponse extends BaseResponse {
  final int balance;
  final ScreenGameData data;

  MainScreenResponse(super.message, super.result, this.balance, this.data);

  factory MainScreenResponse.fromJson(Map<String, dynamic> json) =>
      _$MainScreenResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MainScreenResponseToJson(this);
}
