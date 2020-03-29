import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/utils/utils.dart';

class DayModel {
  DateTime date;
  List<DiagnosedModel> diagnosed;
  int riskSubjects;
  int seriousNumber;
  List<String> seriousId;
  int deathsNumber;
  List<String> deathsId;
  int evacueesNumber;
  List<String> evacueesId;
  int recoveredNumber;
  List<String> recoveredId;

  DayModel({
    this.date,
    this.diagnosed,
    this.riskSubjects,
    this.seriousNumber,
    this.seriousId,
    this.deathsNumber,
    this.deathsId,
    this.evacueesNumber,
    this.evacueesId,
    this.recoveredNumber,
    this.recoveredId,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'fecha': '${date.year}/${date.month}/${date.day}',
      'diagnosticados':
          diagnosed != null ? diagnosed.map((x) => x.toJson()).toList() : null,
      'sujetos_riesgo': riskSubjects,
      'graves_numero': seriousNumber,
      'graves_id': seriousId,
      'muertes_numero': deathsNumber,
      'muertes_id': deathsId,
      'evacuados_numero': evacueesNumber,
      'evacuados_id': evacueesId,
      'recuperados_numero': recoveredNumber,
      'recuperados_id': recoveredId,
    };
  }

  static DayModel fromJson(Map<String, dynamic> json) {
    var year = int.parse(json['fecha'].toString().split('/')[0]);
    var month = int.parse(json['fecha'].toString().split('/')[1]);
    var day = int.parse(json['fecha'].toString().split('/')[2]);
    List<dynamic> diagnosed = json['diagnosticados'];
    List<dynamic> seriousId = json['graves_id'];
    List<dynamic> deathsId = json['muertes_id'];
    List<dynamic> evacueesId = json['evacuados_id'];
    List<dynamic> recoveredId = json['recuperados_id'];
    return DayModel(
      date: DateTime(year, month, day),
      diagnosed: diagnosed != null
          ? diagnosed.map((x) => DiagnosedModel.fromJson(x)).toList()
          : null,
      riskSubjects: json['sujetos_riesgo'],
      seriousNumber: getInt(json['graves_numero']),
      seriousId: seriousId != null
          ? seriousId.map((x) => x.toString()).toList()
          : null,
      deathsNumber: getInt(json['muertes_numero']),
      deathsId:
          deathsId != null ? deathsId.map((x) => x.toString()).toList() : null,
      evacueesNumber: getInt(json['evacuados_numero']),
      evacueesId: evacueesId != null
          ? evacueesId.map((x) => x.toString()).toList()
          : null,
      recoveredNumber: getInt(json['recuperados_numero']),
      recoveredId: recoveredId != null
          ? recoveredId.map((x) => x.toString()).toList()
          : null,
    );
  }
}
