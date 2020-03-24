import 'package:covid19cuba/src/models/models.dart';

class DataModel {
  CasesModel cases;
  DiagnosticCentersModel diagnosticCenters;
  IsolationCentersModel isolationCenters;

  DataModel({
    this.cases,
    this.diagnosticCenters,
    this.isolationCenters,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'casos': cases.toJson(),
      'centros_diagnostico': diagnosticCenters.toJson(),
      'centros_aislamiento': isolationCenters.toJson(),
    };
  }

  static DataModel fromJson(Map<String, dynamic> json) {
    return DataModel(
      cases: CasesModel.fromJson(json['casos']),
      diagnosticCenters: DiagnosticCentersModel.fromJson(json['centros_diagnostico']),
      isolationCenters: IsolationCentersModel.fromJson(json['centros_aislamiento']),
    );
  }
}
