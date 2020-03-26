import 'package:flutter/cupertino.dart';

class CountryTotalModel {
  final String name;
  final List<int> diagnosed;

  const CountryTotalModel({this.name, @required this.diagnosed})
      : assert(diagnosed != null);

  List<int> toJson() {
    return diagnosed;
  }

  static CountryTotalModel fromJson(List<int> json, {String name}) {
    return CountryTotalModel(
      diagnosed: json,
      name: name,
    );
  }
}
