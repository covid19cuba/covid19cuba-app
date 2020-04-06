import 'package:json_annotation/json_annotation.dart';
import 'package:covid19cuba/src/data_providers/data_providers.dart';

import '../utils/utils.dart';

part 'configuration.g.dart';

@JsonSerializable()
class ConfigurationModel {
  @JsonKey(name: Constants.prefCompareCountry)
  String compareCountry;

  ConfigurationModel({
    this.compareCountry,
  });

  factory ConfigurationModel.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigurationModelToJson(this);

  void saveCountry(String c){
    this.compareCountry=c;
    setConfigurationToCache(this);
  }
}
