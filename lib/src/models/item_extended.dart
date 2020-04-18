import 'package:json_annotation/json_annotation.dart';

part 'item_extended.g.dart';

@JsonSerializable()
class ItemExtended {
  String name;
  int value;
  int confirmed;
  int recovered;
  int deaths;

  ItemExtended();

  factory ItemExtended.fromJson(Map<String, dynamic> json) => _$ItemExtendedFromJson(json);

  Map<String, dynamic> toJson() => _$ItemExtendedToJson(this);
}
