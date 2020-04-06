import 'package:json_annotation/json_annotation.dart';

part 'item_code.g.dart';

@JsonSerializable()
class ItemCode {
  String code;
  String name;
  int value;

  ItemCode();

  factory ItemCode.fromJson(Map<String, dynamic> json) =>
      _$ItemCodeFromJson(json);

  Map<String, dynamic> toJson() => _$ItemCodeToJson(this);
}
