import 'package:json_annotation/json_annotation.dart';
import 'package:covid19cuba/src/data_providers/data_providers.dart';

part 'configuration.g.dart';

@JsonSerializable()
class ConfigurationModel {
  @JsonKey(name: 'pais_comparar')
  String compare_country;

  ConfigurationModel({
    this.compare_country,
  });

  factory ConfigurationModel.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigurationModelToJson(this);

  void saveCountry(String c){
    this.compare_country=c;
    setConfigurationToCache(this);
  }
}
