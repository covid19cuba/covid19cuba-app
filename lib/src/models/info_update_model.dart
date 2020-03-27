import 'package:flutter/material.dart';

class InfoUpdate{
  final DateTime date;
  final bool needupdate;

  const InfoUpdate({
    @required this.needupdate,
    this.date
  });

  static InfoUpdate fromJson(Map<String, dynamic> json){
    if (json['success']){
      return InfoUpdate(needupdate: true, date: DateTime.fromMillisecondsSinceEpoch(int.parse(json['updated'])));
    }
    return InfoUpdate(needupdate: false);
  }

  Map<String,dynamic> toJson(){
    return <String,dynamic> {
      'updated' : date.toIso8601String(),
      'neeoupdate' : needupdate
    };
  }
}