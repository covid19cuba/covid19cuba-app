import 'package:json_annotation/json_annotation.dart';

part 'info_update_model.g.dart';

@JsonSerializable()
class InfoUpdate {
  @JsonKey(name: 'updated', fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  final DateTime date;
  @JsonKey(defaultValue: false)
  final bool needUpdate;

  const InfoUpdate({this.needUpdate, this.date});

  static DateTime dateTimeFromJson(String x) {
    return DateTime.fromMillisecondsSinceEpoch(
      int.parse(x),
    );
  }

  static String dateTimeToJson(DateTime dateTime) {
    return dateTime.toIso8601String();
  }

  Map<String, dynamic> toJson() => _$InfoUpdateToJson(this);

  static InfoUpdate fromJson(Map<String, dynamic> json) {
    if (json['success']) {
      return _$InfoUpdateFromJson(json);
    }
    return InfoUpdate(needUpdate: false);
  }
}
