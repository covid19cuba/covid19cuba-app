import 'package:json_annotation/json_annotation.dart';

part 'jt_new_model.g.dart';

@JsonSerializable()
class JTNewModel {
  String id;
  String link;
  String title;
  String author;
  List<int> published;
  List<int> updated;
  String summary;

  JTNewModel();

  factory JTNewModel.fromJson(Map<String, dynamic> json) =>
      _$JTNewModelFromJson(json);

  Map<String, dynamic> toJson() => _$JTNewModelToJson(this);
}
