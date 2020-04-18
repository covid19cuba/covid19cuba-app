import 'package:flutter/material.dart';

import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/widgets/widgets.dart';

class ProvinceWidget extends StatefulWidget {
  final DataModel data;
  final String province;

  ProvinceWidget({this.data, this.province})
      : assert(data != null, province != null);

  @override
  ProvinceWidgetState createState() => ProvinceWidgetState(
        data: data,
        province: province,
      );
}

class ProvinceWidgetState extends State<ProvinceWidget> {
  final DataModel data;
  final String province;
  ProvinceModel provinceData;

  ProvinceWidgetState({this.data, this.province}) {
    assert(data != null, province != null);
    provinceData = data.provinces[province].all;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
            Container(
              color: Constants.primaryColor,
              child: ResumeWidget(
                resume: provinceData.resume,
                updated: provinceData.updated,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 5, right: 5, top: 5),
              child: Card(
                child: ProvinceMapWebViewWidget(
                  mapData: provinceData.mapData,
                  provinceCode: provinceData.provinceCode,
                ),
              ),
            )
          ] +
          (provinceData.resume.map((a) => a.value).reduce((a, b) => a + b) == 0
              ? []
              : <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                    child: Card(
                      child: PieSexWidget(casesBySex: provinceData.casesBySex),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                    child: Card(
                      child: PieContagionWidget(
                        casesByModeOfContagion:
                            provinceData.casesByModeOfContagion,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                    child: Card(
                      child: EvolutionCasesWidget(
                        evolutionOfCasesByDays:
                            provinceData.evolutionOfCasesByDays,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                    child: Card(
                      child: DistributionAgeGroupsDiagnosedWidget(
                        distributionByAgeRanges:
                            provinceData.distributionByAgeRanges,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                    child: Card(
                      child: PieCasesNationalityWidget(
                        casesByNationality: provinceData.casesByNationality,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                    child: Card(
                      child: DistributionNationalityDiagnosedWidget(
                        distributionByNationalityOfForeignCases: provinceData
                            .distributionByNationalityOfForeignCases,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                    child: Card(
                      child: Container(
                        child: TableData(
                          title: 'Municipios Afectados',
                          headers: [
                            'Municipios',
                            'Casos',
                            '% del total',
                          ],
                          values: [
                            provinceData.affectedMunicipalities
                                .map(
                                  (x) => x.name,
                                )
                                .toList(),
                            provinceData.affectedMunicipalities
                                .map((x) => x.value.toString())
                                .toList(),
                            provinceData.affectedMunicipalities
                                .map(
                                  (x) =>
                                      (x.value * 100 / x.total)
                                          .toStringAsFixed(2) +
                                      '%',
                                )
                                .toList(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                    child: Card(
                      child: MunicipalitiesComparisonWidget(
                        data: data,
                        province: province,
                      ),
                    ),
                  ),
                  Container(padding: EdgeInsets.all(5)),
                ]),
    );
  }
}
