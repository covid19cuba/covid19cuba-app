import 'package:flutter/material.dart';

class InfoUpdate {
  final DateTime date;
  final bool needUpdate;

  const InfoUpdate({@required this.needUpdate, this.date});

  static InfoUpdate fromJson(Map<String, dynamic> json) {
    if (json['success']) {
      return InfoUpdate(
        needUpdate: true,
        date: DateTime.fromMillisecondsSinceEpoch(
          int.parse(
            json['updated'],
          ),
        ),
      );
    }
    return InfoUpdate(needUpdate: false);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'updated': date.toIso8601String(),
      'needUpdate': needUpdate,
    };
  }
}
