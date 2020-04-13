import 'package:json_annotation/json_annotation.dart';

import 'package:covid19cuba/src/utils/utils.dart';

part 'changelog_item.g.dart';

@JsonSerializable()
class ChangelogItem {
  String version;
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  DateTime date;
  List<String> changed;
  List<String> added;
  List<String> fixed;
  List<String> deleted;

  ChangelogItem();

  factory ChangelogItem.fromJson(Map<String, dynamic> json) =>
      _$ChangelogItemFromJson(json);

  Map<String, dynamic> toJson() => _$ChangelogItemToJson(this);
}
