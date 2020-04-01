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
    var result = List<List<dynamic>>();
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
      result.add(actual);
    }
    result = result.reversed.toList();
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

  List<Map<String, dynamic>> get top10Province {
    var provs = Map<String, int>();
    int total = 0;
    days
        .where((x) => x.diagnosed != null)
        .map((x) => x.diagnosed)
        .forEach((diagnosed) {
      diagnosed.forEach((item) {
        if (provs.containsKey(item.detectionProvince)) {
          ++provs[item.detectionProvince];
        } else {
          provs[item.detectionProvince] = 1;
        }
        total+=1;
      });
    });
    var result = List<Map<String, dynamic>>();
    provs.forEach((k, v) { result.add({'Provincia': k, 'casos': v, 'total': total});});
    result.sort((a,b)=> -(a['casos'].compareTo(b['casos'])));
    var res =result.sublist(0,10);
    int cont=1;
    for(var item in res){
      item.addEntries([MapEntry('index',cont)]);
      cont+=1;
    }
    return res;
  }

  List<Map<String, dynamic>> get top10Municipality {
    var mun = Map<String, int>();
    var mun2 = Map<String, String>();
    int total = 0;
    days
        .where((x) => x.diagnosed != null)
        .map((x) => x.diagnosed)
        .forEach((diagnosed) {
      diagnosed.forEach((item) {
        if (mun.containsKey(item.detectionMunicipality)) {
          ++mun[item.detectionMunicipality];
        } else {
          mun2[item.detectionMunicipality]=item.detectionProvince;
          mun[item.detectionMunicipality] = 1;
        }
        total+=1;
      });
    });
    var result = List<Map<String, dynamic>>();
    mun.forEach((k, v) { result.add({'Municipio': k, 'casos': v, 'total': total});});
    result.sort((a,b)=> -(a['casos'].compareTo(b['casos'])));
    var res =result.sublist(0,10);
    int cont=1;
    for(var item in res){
      item.addEntries([MapEntry('index',cont)]);
      item.addEntries([MapEntry('Provincia',mun2[item['Municipio']])]);
      cont+=1;
    }
    return res;
  }

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}
