import 'package:json_annotation/json_annotation.dart';

import 'package:covid19cuba/src/utils/utils.dart';

part 'moment.g.dart';

@JsonSerializable()
class MomentModel {
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  DateTime date;
  String value;

  MomentModel();

  factory MomentModel.fromJson(Map<String, dynamic> json) =>
      _$MomentModelFromJson(json);

  Map<String, dynamic> toJson() => _$MomentModelToJson(this);
}