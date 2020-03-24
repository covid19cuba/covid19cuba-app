
import 'package:flutter/cupertino.dart';

class NewsModel{
  final DateTime date;
  final String provider;
  final String message;

  const NewsModel({@required this.date, @required this.provider, @required this.message})
      : assert(date != null),
        assert(provider != null),
        assert(message != null);

  static NewsModel fromJson(Map<String, dynamic> json){
      return NewsModel(
        date: new DateTime.fromMicrosecondsSinceEpoch(json['timestamp'] * 1000),
        provider: json['user'],
        message: json['message']
      );
  }

  static List<NewsModel> newsfromJson(Map<String, dynamic> json){
      var newslist = new List<NewsModel>();
      if (json['state'] != 'success'){
        return null;
      }
      for(var key in json['entries']){
        newslist.add(NewsModel.fromJson(key));
      }
      return newslist;
  }

}