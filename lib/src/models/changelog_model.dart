import 'package:json_annotation/json_annotation.dart';

import 'package:covid19cuba/src/models/models.dart';

part 'changelog_model.g.dart';

@JsonSerializable()
class ChangelogModel {
  List<ChangelogItem> changelog;

  ChangelogModel();

  factory ChangelogModel.fromJson(Map<String, dynamic> json) =>
      _$ChangelogModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChangelogModelToJson(this);
}
