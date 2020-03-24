class DiagnosedModel {
  String id;
  String country;
  int age;
  String sex;
  DateTime arrivalInCubaFocus;
  DateTime medicalConsultation;
  String detectionMunicipality;
  String detectionProvince;
  String dpacodeMunicipalityDetection;
  String dpacodeProvinceDetection;
  List<String> visitedProvinces;
  List<String> dpacodeVisitedProvinces;
  String contagion;
  int focalContact;
  String isolationCenter;
  String diagnosticCenter;
  List<String> possibleOriginContagion;

  DiagnosedModel({
    this.id,
    this.country,
    this.age,
    this.sex,
    this.arrivalInCubaFocus,
    this.medicalConsultation,
    this.detectionMunicipality,
    this.detectionProvince,
    this.dpacodeMunicipalityDetection,
    this.dpacodeProvinceDetection,
    this.visitedProvinces,
    this.dpacodeVisitedProvinces,
    this.contagion,
    this.focalContact,
    this.isolationCenter,
    this.diagnosticCenter,
    this.possibleOriginContagion,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'pais': country,
      'edad': age,
      'sexo': sex,
      'arribo_a_cuba_foco': arrivalInCubaFocus != null
          ? '${arrivalInCubaFocus.year}/${arrivalInCubaFocus.month}/${arrivalInCubaFocus.day}'
          : null,
      'consulta_medico': medicalConsultation != null
          ? '${medicalConsultation.year}/${medicalConsultation.month}/${medicalConsultation.day}'
          : null,
      'municipio_detección': detectionMunicipality,
      'provincia_detección': detectionProvince,
      'dpacode_municipio_deteccion': dpacodeMunicipalityDetection,
      'dpacode_provincia_deteccion': dpacodeProvinceDetection,
      'provincias_visitadas': visitedProvinces,
      'dpacode_provincias_visitadas': dpacodeVisitedProvinces,
      'contagio': contagion,
      'contacto_focal': focalContact,
      'centro_aislamiento': isolationCenter,
      'centro_diagnostico': diagnosticCenter,
      'posible_procedencia_contagio': possibleOriginContagion,
    };
  }

  static DiagnosedModel fromJson(Map<String, dynamic> json) {
    int year1, month1, day1;
    if (json['arribo_a_cuba_foco'] != null) {
      year1 = int.parse(json['arribo_a_cuba_foco'].toString().split('/')[0]);
      month1 = int.parse(json['arribo_a_cuba_foco'].toString().split('/')[1]);
      day1 = int.parse(json['arribo_a_cuba_foco'].toString().split('/')[2]);
    }
    int year2, month2, day2;
    if (json['consulta_medico'] != null) {
      year2 = int.parse(json['consulta_medico'].toString().split('/')[0]);
      month2 = int.parse(json['consulta_medico'].toString().split('/')[1]);
      day2 = int.parse(json['consulta_medico'].toString().split('/')[2]);
    }
    List<dynamic> visitedProvinces = json['provincias_visitadas'];
    List<dynamic> dpacodeVisitedProvinces =
        json['dpacode_provincias_visitadas'];
    List<dynamic> possibleOriginContagion =
        json['posible_procedencia_contagio'];
    return DiagnosedModel(
      id: json['id'],
      country: json['pais'],
      age: json['edad'],
      sex: json['sexo'],
      arrivalInCubaFocus: json['arribo_a_cuba_foco'] != null
          ? DateTime(year1, month1, day1)
          : null,
      medicalConsultation: json['consulta_medico'] != null
          ? DateTime(year2, month2, day2)
          : null,
      detectionMunicipality: json['municipio_detección'],
      detectionProvince: json['provincia_detección'],
      dpacodeMunicipalityDetection: json['dpacode_municipio_deteccion'],
      dpacodeProvinceDetection: json['dpacode_provincia_deteccion'],
      visitedProvinces: visitedProvinces.map((x) => x.toString()).toList(),
      dpacodeVisitedProvinces:
          dpacodeVisitedProvinces.map((x) => x.toString()).toList(),
      contagion: json['contagio'],
      focalContact: json['contacto_focal'],
      isolationCenter: json['centro_aislamiento'],
      diagnosticCenter: json['centro_diagnostico'],
      possibleOriginContagion:
          possibleOriginContagion.map((x) => x.toString()).toList(),
    );
  }
}
