import 'package:covid19cuba/models/models.dart';

class IsolationCentersModel {
  Map<String, CenterModel> centers;

  IsolationCentersModel({this.centers});

  Map<String, dynamic> toJson() {
    var result = Map<String, dynamic>();
    for (var key in centers.keys) {
      result[key] = centers[key].toJson();
    }
    return result;
  }

  static IsolationCentersModel fromJson(Map<String, dynamic> json) {
    var centers = Map<String, CenterModel>();
    for (var key in json.keys) {
      var center = CenterModel.fromJson(json[key]);
      centers[key] = center;
    }
    return IsolationCentersModel(centers: centers);
  }
}
