import 'package:json_annotation/json_annotation.dart';

part 'item_municipality.g.dart';

@JsonSerializable()
class ItemMunicipality {
  int value;
  String name;
  int total;
  String province;

  ItemMunicipality();

  factory ItemMunicipality.fromJson(Map<String, dynamic> json) =>
      _$ItemMunicipalityFromJson(json);

  Map<String, dynamic> toJson() => _$ItemMunicipalityToJson(this);
}
