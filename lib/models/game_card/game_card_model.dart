import 'package:json_annotation/json_annotation.dart';
part 'game_card_model.g.dart';

@JsonSerializable()
class GameCardModel {
  final String? prize;
  final String? day;
  final String? gameName;
  final String? duration;

  GameCardModel({this.prize, this.day, this.gameName, this.duration});
}
