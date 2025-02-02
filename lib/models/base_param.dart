import 'package:json_annotation/json_annotation.dart';

part 'base_param.g.dart';

@JsonSerializable()
class BaseParam {
  String uniqe_id = "ffc22d20-d7db-11ef-97aa-5b10ceba786f";
  BaseParam(this.uniqe_id);
}
