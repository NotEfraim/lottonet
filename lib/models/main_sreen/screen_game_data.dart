import 'package:json_annotation/json_annotation.dart';

part 'screen_game_data.g.dart';

@JsonSerializable()
class ScreenGameData {
  final String? lottoDate;
  final int? lottoID;
  final int? lottoPrise;
  final String? chanceDate;
  final int? chanceId;
  final int? chancePrise;
  final String? date777;
  final int? id777;
  final int? prise777;
  final String? date123;
  final int? id123;
  final int? prise123;

  ScreenGameData(
      this.lottoDate,
      this.lottoID,
      this.lottoPrise,
      this.chanceDate,
      this.chanceId,
      this.chancePrise,
      this.date777,
      this.id777,
      this.prise777,
      this.date123,
      this.id123,
      this.prise123);

  factory ScreenGameData.fromJson(Map<String, dynamic> json) =>
      _$ScreenGameDataFromJson(json);
  Map<String, dynamic> toJson() => _$ScreenGameDataToJson(this);
}
