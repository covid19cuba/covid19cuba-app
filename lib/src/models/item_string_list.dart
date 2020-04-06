import 'package:json_annotation/json_annotation.dart';

part 'item_string_list.g.dart';

@JsonSerializable()
class ItemStringList {
  String name;
  List<String> values;

  ItemStringList();

  factory ItemStringList.fromJson(Map<String, dynamic> json) =>
      _$ItemStringListFromJson(json);

  Map<String, dynamic> toJson() => _$ItemStringListToJson(this);
}
