import 'package:covid19cuba/src/utils/constants.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:covid19cuba/src/models/models.dart';

part 'data_model.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class DataModel {
  @JsonKey(name: 'all')
  CubaModel all;

  @JsonKey(name: 'provinces')
  Map<String, ProvincesModel> provinces;

  DataModel();

  MunicipalitiesModel getMunicipality(String code) {
    if (code == '40.01') {
      return provinces['ijv'].municipalities[code];
    }
    var prov = code.split('.')[0];
    var abbr = Constants.provincesCodes[prov];
    return provinces[abbr].municipalities[code];
  }

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}
