import 'package:flutter/cupertino.dart';

import 'country_total_model.dart';

class WorldTotalsModel {
  final List<CountryTotalModel> countries;

  const WorldTotalsModel({@required this.countries})
      : assert(countries != null);

  Map<String, dynamic> toJson() {
    var json = Map<String, dynamic>();
    for (var country in countries) {
      json[country.name] = country.toJson();
    }
    return json;
  }

  static WorldTotalsModel fromJson(Map<String, dynamic> json) {
    var countries = List<CountryTotalModel>();
    for (String country in json.keys) {
      countries.add(CountryTotalModel.fromJson(json[country], name: country));
    }
    return WorldTotalsModel(
      countries: countries,
    );
  }
}
