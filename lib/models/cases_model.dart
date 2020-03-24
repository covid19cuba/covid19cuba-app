import 'package:covid19cuba/models/models.dart';

class CasesModel {
  Map<String, DayModel> days;

  CasesModel({this.days});

  Map<String, dynamic> toJson() {
    var result = Map<String, dynamic>();
    for (var key in days.keys) {
      result[key] = days[key].toJson();
    }
    return <String, dynamic>{
      'dias': result,
    };
  }

  static CasesModel fromJson(Map<String, dynamic> json) {
    json = json['dias'];
    var days = Map<String, DayModel>();
    for (var key in json.keys) {
      var day = DayModel.fromJson(json[key]);
      days[key] = day;
    }
    return CasesModel(days: days);
  }
}
