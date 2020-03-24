import 'package:covid19cuba/src/models/models.dart';

class DiagnosticCentersModel {
  Map<String, CenterModel> centers;

  DiagnosticCentersModel({this.centers});

  Map<String, dynamic> toJson() {
    var result = Map<String, dynamic>();
    for (var key in centers.keys) {
      result[key] = centers[key].toJson();
    }
    return result;
  }

  static DiagnosticCentersModel fromJson(Map<String, dynamic> json) {
    var centers = Map<String, CenterModel>();
    for (var key in json.keys) {
      var center = CenterModel.fromJson(json[key]);
      centers[key] = center;
    }
    return DiagnosticCentersModel(centers: centers);
  }
}
