import 'package:flutter/cupertino.dart';

class WorldTotalsModel {
  final Map<String, List<int>> countries;

  const WorldTotalsModel({@required this.countries})
      : assert(countries != null);

  Map<String, dynamic> toJson() {
    var json = Map<String, dynamic>();
    for (var country in countries.keys) {
      json[country] = countries[country];
    }
    return json; // Don't know if countries as Map<String, dynamic> works
  }

  static WorldTotalsModel fromJson(Map<String, dynamic> json) {
    var countries = Map<String, List<int>>();
    for (String country in json.keys) {
      countries[country] = List<int>();
      for (int value in json[country]) {
        countries[country].add(value);
      }
    }
    return WorldTotalsModel(
      countries: countries,
    );
  }
}
