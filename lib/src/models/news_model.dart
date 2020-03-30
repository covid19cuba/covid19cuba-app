import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

@JsonSerializable()
class SimpleNews {
  @JsonKey(
    name: 'timestamp',
    fromJson: dateTimeFromJson,
    toJson: dateTimeToJson,
  )
  final DateTime date;
  final String provider;
  final String message;

  const SimpleNews({this.date, this.provider, this.message});

  static DateTime dateTimeFromJson(String x) {
    return DateTime.fromMicrosecondsSinceEpoch(int.parse(x) * 1000);
  }

  static String dateTimeToJson(DateTime dateTime) {
    return dateTime.toIso8601String();
  }

  factory SimpleNews.fromJson(Map<String, dynamic> json) =>
      _$SimpleNewsFromJson(json);

  Map<String, dynamic> toJson() => _$SimpleNewsToJson(this);
}

@JsonSerializable()
class NewsModel {
  @JsonKey(name: 'entries')
  final List<SimpleNews> news;

  const NewsModel({this.news});

  static NewsModel fromJson(Map<String, dynamic> json) {
    if (!json.containsKey('success') || !json['success']) {
      return null;
    }
    return _$NewsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}
