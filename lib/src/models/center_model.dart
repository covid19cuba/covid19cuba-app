import 'package:json_annotation/json_annotation.dart';

part 'center_model.g.dart';

@JsonSerializable()
class CenterModel {
  String id;
  @JsonKey(name: 'nombre')
  String name;
  @JsonKey(name: 'provincia')
  String province;
  @JsonKey(name: 'dpacode_provincia')
  String dpacodeProvince;

  CenterModel({
    this.id,
    this.name,
    this.province,
    this.dpacodeProvince,
  });

  factory CenterModel.fromJson(Map<String, dynamic> json) =>
      _$CenterModelFromJson(json);

  Map<String, dynamic> toJson() => _$CenterModelToJson(this);
}
