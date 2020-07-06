// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/models/model.dart';
import 'package:covid19cuba/src/models/news/news_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable()
class News extends Model {
  List<NewsItem> news;

  News();

  factory News.fromJson(Map<String, dynamic> json) =>
      _$NewsFromJson(json);

  Map<String, dynamic> toJson() => _$NewsToJson(this);
}
