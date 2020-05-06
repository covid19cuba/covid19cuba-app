import 'package:json_annotation/json_annotation.dart';

import 'package:covid19cuba/src/models/jt_new_model.dart';

part 'jt_news_model.g.dart';

@JsonSerializable()
class JTNewsModel {
  List<JTNewModel> news;

  JTNewsModel();

  factory JTNewsModel.fromJson(Map<String, dynamic> json) =>
      _$JTNewsModelFromJson(json);

  Map<String, dynamic> toJson() => _$JTNewsModelToJson(this);
}
