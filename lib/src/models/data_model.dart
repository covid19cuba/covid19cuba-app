import 'package:json_annotation/json_annotation.dart';

import 'package:covid19cuba/src/models/models.dart';

part 'data_model.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class DataModel {
  @JsonKey(name: 'casos')
  CasesModel cases;

  @JsonKey(name: 'centros_diagnostico')
  Map<String, CenterModel> diagnosticCenters;

  @JsonKey(name: 'centros_aislamiento')
  Map<String, CenterModel> isolationCenters;

  @JsonKey(name: 'note-text')
  String note;

  DataModel({
    this.cases,
    this.diagnosticCenters,
    this.isolationCenters,
    this.note,
  });

  int get numberOfDiagnosed {
    return cases.days.values
        .where((x) => x.diagnosed != null)
        .map((x) => x.diagnosed.length)
        .reduce((v, e) => v + e);
  }

  int get numberOfDeaths {
    return cases.days.values
        .where((x) => x.deathsNumber != null)
        .map((x) => x.deathsNumber)
        .reduce((v, e) => v + e);
  }

  int get numberOfEvacuees {
    return cases.days.values
        .where((x) => x.evacueesNumber != null)
        .map((x) => x.evacueesNumber)
        .reduce((v, e) => v + e);
  }

  int get numberOfRecovered {
    return cases.days.values
        .where((x) => x.recoveredNumber != null)
        .map((x) => x.recoveredNumber)
        .reduce((v, e) => v + e);
  }

  int get numberOfActive {
    return numberOfDiagnosed -
        numberOfDeaths -
        numberOfEvacuees -
        numberOfRecovered;
  }

  List<DayModel> get days {
    var result = cases.days.values.toList();
    result.sort((a, b) => a.date.compareTo(b.date));
    return result;
  }

  DateTime get update => days.last.date;

  List<DiagnosedModel> get diagnosed {
    var result = List<DiagnosedModel>();
    days.where((x) => x.diagnosed != null).forEach((x) {
      result.addAll(x.diagnosed);
    });
    return result;
  }

  List<String> get ageGroupsNames {
    return [
      '0-18',
      '19-40',
      '41-60',
      '>=61',
      'Desconocido',
    ];
  }

  List<List<dynamic>> get tests {
    var preResult = List<List<dynamic>>();
    var days = this.days.reversed.toList();
    var accumulated = this.accumulated.reversed.toList();
    for (var i = 0; i < days.length; ++i) {
      if (days[i].testsTotal == null) {
        break;
      }
      var actual = List<dynamic>();
      actual.add(days[i].date);
      actual.add(accumulated[i]);
      actual.add(days[i].testsTotal - accumulated[i]);
      actual.add(days[i].testsTotal);
      preResult.add(actual);
    }
    preResult = preResult.reversed.toList();
    var result = List<List<dynamic>>();
    for (var i = 1; i < preResult.length; ++i) {
      var actual = List<dynamic>();
      actual.add(preResult[i][0]);
      actual.add(preResult[i][1] - preResult[i - 1][1]);
      actual.add(preResult[i][2] - preResult[i - 1][2]);
      actual.add(preResult[i][3] - preResult[i - 1][3]);
      result.add(actual);
    }
    return result;
  }

  Map<String, int> get casesNationality {
    var result = <String, int>{
      'Extranjeros': 0,
      'Cubanos': 0,
      'No Reportados': 0,
    };
    days
        .where((x) => x.diagnosed != null)
        .map((x) => x.diagnosed)
        .forEach((diagnosed) {
      diagnosed.forEach((item) {
        if (item.country == null || item.country.isEmpty) {
          ++result['No Reportados'];
        } else if (item.country == 'cu') {
          ++result['Cubanos'];
        } else {
          ++result['Extranjeros'];
        }
      });
    });
    return result;
  }

  Map<String, String> get contagionsPretty {
    return <String, String>{
      'importado': 'Importados',
      'introducido': 'Introducidos',
      'autoctono': 'Autóctonos',
      'desconocido': 'Desconocidos',
    };
  }

  Map<String, int> get contagions {
    var result = <String, int>{
      'importado': 0,
      'introducido': 0,
      'autoctono': 0,
      'desconocido': 0,
    };
    days
        .where((x) => x.diagnosed != null)
        .map((x) => x.diagnosed)
        .forEach((diagnosed) {
      diagnosed.forEach((item) {
        if (item.contagion == null) {
          ++result['desconocido'];
        } else if (result.containsKey(item.contagion)) {
          ++result[item.contagion];
        } else {
          result[item.contagion] = 0;
        }
      });
    });
    return result;
  }

  Map<String, String> get gendersPretty {
    return <String, String>{
      'hombre': 'Hombres',
      'mujer': 'Mujeres',
      'no reportado': 'No Reportados',
    };
  }

  Map<String, int> get genders {
    var result = <String, int>{
      'hombre': 0,
      'mujer': 0,
      'no reportado': 0,
    };
    days
        .where((x) => x.diagnosed != null)
        .map((x) => x.diagnosed)
        .forEach((diagnosed) {
      diagnosed.forEach((item) {
        if (item.sex == null) {
          ++result['desconocido'];
        } else if (result.containsKey(item.sex)) {
          ++result[item.sex];
        } else {
          result[item.sex] = 0;
        }
      });
    });
    return result;
  }

  List<int> get ageGroups {
    var result = [0, 0, 0, 0, 0];
    days
        .where((x) => x.diagnosed != null)
        .map((x) => x.diagnosed)
        .forEach((diagnosed) {
      diagnosed.forEach((item) {
        var age = item.age;
        if (age == null) {
          ++result[4];
        } else if (0 <= age && age <= 18) {
          ++result[0];
        } else if (19 <= age && age <= 40) {
          ++result[1];
        } else if (41 <= age && age <= 60) {
          ++result[2];
        } else {
          ++result[3];
        }
      });
    });
    return result;
  }

  Map<String, String> get countriesPretty {
    return <String, String>{
      'cu': 'Cuba',
      'it': 'Italia',
      'be': 'Bélgica',
      'us': 'USA',
      'fr': 'Francia',
      'ca': 'Canadá',
      'es': 'España',
      'cn': 'China',
      'ru': 'Rusia',
      'uy': 'Uruguay',
      'do': 'R.Dominicana',
    };
  }

  Map<String, int> get countries {
    var result = Map<String, int>();
    days
        .where((x) => x.diagnosed != null)
        .map((x) => x.diagnosed)
        .forEach((diagnosed) {
      diagnosed.forEach((item) {
        if (result.containsKey(item.country)) {
          ++result[item.country];
        } else {
          result[item.country] = 1;
        }
      });
    });
    return result;
  }

  List<int> get accumulated {
    var result = List<int>();
    for (var item
        in days.map((x) => x.diagnosed != null ? x.diagnosed.length : 0)) {
      if (result.length == 0) {
        result.add(item);
      } else {
        result.add(item + result.last);
      }
    }
    return result;
  }

  List<int> get actives {
    var result = List<int>();
    var total = 0;
    var deaths = 0;
    var recover = 0;
    var evacuees = 0;
    for (var item in days) {
      total += item.diagnosed?.length ?? 0;
      deaths += item.deathsNumber ?? 0;
      recover += item.recoveredNumber ?? 0;
      evacuees += item.evacueesNumber ?? 0;
      result.add(total - deaths - recover - evacuees);
    }
    return result;
  }

  List<int> get accumulatedRecovered {
    var result = List<int>();
    for (var item in days.map((x) => x.recoveredNumber ?? 0)) {
      if (result.length == 0) {
        result.add(item);
      } else {
        result.add(item + result.last);
      }
    }
    return result;
  }

  List<int> get recovered {
    var result = List<int>();
    for (var item in days.map((x) => x.recoveredNumber ?? 0)) {
      result.add(item);
    }
    return result;
  }

  List<int> get accumulatedDeath {
    var result = List<int>();
    for (var item in days.map((x) => x.deathsNumber ?? 0)) {
      if (result.length == 0) {
        result.add(item);
      } else {
        result.add(item + result.last);
      }
    }
    return result;
  }

  List<int> get death {
    var result = List<int>();
    for (var item in days.map((x) => x.deathsNumber ?? 0)) {
      result.add(item);
    }
    return result;
  }

  List<Map<String, dynamic>> get top10Province {
    var provinces = Map<String, int>();
    days
        .where((x) => x.diagnosed != null)
        .map((x) => x.diagnosed)
        .forEach((diagnosed) {
      diagnosed.forEach((item) {
        if (provinces.containsKey(item.detectionProvince)) {
          ++provinces[item.detectionProvince];
        } else {
          provinces[item.detectionProvince] = 1;
        }
      });
    });
    var total = provinces.values.reduce((a, b) => a + b);
    var result = List<Map<String, dynamic>>();
    provinces.forEach((k, v) {
      if (k != null) {
        result.add({'province': k, 'cases': v, 'total': total});
      }
    });
    result.sort((a, b) => b['cases'].compareTo(a['cases']));
    result = result.take(10).toList();
    var cont = 1;
    for (var item in result) {
      item.addEntries([MapEntry('index', cont)]);
      cont += 1;
    }
    return result;
  }

  List<Map<String, dynamic>> get top10Municipality {
    var municipalities = Map<String, int>();
    var provinces = Map<String, String>();
    days
        .where((x) => x.diagnosed != null)
        .map((x) => x.diagnosed)
        .forEach((diagnosed) {
      diagnosed.forEach((item) {
        if (municipalities.containsKey(item.detectionMunicipality)) {
          ++municipalities[item.detectionMunicipality];
        } else {
          provinces[item.detectionMunicipality] = item.detectionProvince;
          municipalities[item.detectionMunicipality] = 1;
        }
      });
    });
    var total = municipalities.values.reduce((a, b) => a + b);
    var result = List<Map<String, dynamic>>();
    municipalities.forEach((k, v) {
      if (k != null) {
        result.add({'municipality': k, 'cases': v, 'total': total});
      }
    });
    result.sort((a, b) => b['cases'].compareTo(a['cases']));
    result = result.take(10).toList();
    var cont = 1;
    for (var item in result) {
      item.addEntries([MapEntry('index', cont)]);
      item.addEntries([MapEntry('province', provinces[item['municipality']])]);
      cont += 1;
    }
    return result;
  }

  Map<String, Map<String, int>> get mapData {
    var municipalities = Map<String, int>();
    var provinces = Map<String, int>();
    days
        .where((x) => x.diagnosed != null)
        .map((x) => x.diagnosed)
        .forEach((diagnosed) {
      diagnosed.forEach((item) {
        if (municipalities.containsKey(item.dpacodeMunicipalityDetection)) {
          ++municipalities[item.dpacodeMunicipalityDetection];
        } else {
          municipalities[item.dpacodeMunicipalityDetection] = 1;
        }
        if (provinces.containsKey(item.dpacodeProvinceDetection)) {
          ++provinces[item.dpacodeProvinceDetection];
        } else {
          provinces[item.dpacodeProvinceDetection] = 1;
        }
      });
    });
    var total = 0;
    var maxMunicipality = 0;
    var maxProvince = 0;
    municipalities.forEach((k, v) {
      if (k != null) {
        if (v > maxMunicipality) {
          maxMunicipality = v;
        }
      }
    });
    provinces.forEach((k, v) {
      if (k != null) {
        if (v > maxMunicipality) {
          maxProvince = v;
        }
        total += v;
      }
    });
    return {
      'muns': municipalities,
      'pros': provinces,
      'genInfo': {
        'max_muns': maxMunicipality,
        'max_pros': maxProvince,
        'total': total,
      }
    };
  }

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}
