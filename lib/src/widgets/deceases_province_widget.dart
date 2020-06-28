// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/models/charts/data.dart';
import 'package:covid19cuba/src/models/charts/province.dart';
import 'package:covid19cuba/src/utils/call_to_action.dart';
import 'package:covid19cuba/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DeceasesProvinceWidget extends StatefulWidget {
  final Data data;
  final String province;

  DeceasesProvinceWidget({this.data, this.province})
      : assert(data != null, province != null);

  @override
  DeceasesProvinceWidgetState createState() => DeceasesProvinceWidgetState(
        data: data,
        province: province,
      );
}

class DeceasesProvinceWidgetState extends State<DeceasesProvinceWidget> {
  final Data data;
  final String province;
  Province provinceData;

  DeceasesProvinceWidgetState({this.data, this.province}) {
    assert(data != null, province != null);
    provinceData = data.provinces[province].all;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
            if (shouldBe()) getWidget(context),
            Container(
              margin: EdgeInsets.only(left: 5, right: 5, top: 5),
              child: Card(
                child: ResumeWidget(resume: provinceData.deceasesResume),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 5, right: 5, top: 5),
              child: Card(
                child: ProvinceMapWebViewWidget(
                  mapData: provinceData.deceasesMapData,
                  provinceCode: provinceData.provinceCode,
                  title: 'Fallecidos',
                  titleMunicipality:
                      'Distribución de fallecidos por municipios',
                ),
              ),
            )
          ] +
          (provinceData.deceasesEvolutionByDays.accumulated.values.last == 0
              ? []
              : <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                    child: Card(
                      child: EvolutionDeathWidget(
                        evolutionOfDeathsByDays:
                            provinceData.deceasesEvolutionByDays,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                    child: Card(
                      child: PieSexWidget(
                        casesBySex: provinceData.deceasesBySex,
                        title: 'Fallecidos',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                    child: Card(
                      child: DistributionAgeGroupsDeceasesWidget(
                        distributionByAgeRanges:
                            provinceData.deceasesDistributionByAgeRanges,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                    child: Card(
                      child: PieCasesNationalityWidget(
                        casesByNationality: provinceData.deceasesByNationality,
                        title: 'Fallecidos',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                    child: Card(
                      child: PieDeceasesDistributionAmountDiseaseHistoryWidget(
                        deceasesDistributionAmountDiseaseHistory: provinceData
                            .deceasesDistributionAmountDiseaseHistory,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                    child: Card(
                      child: DeceasesCommonPreviousDiseasesWidget(
                        deceasesCommonPreviousDiseases:
                            provinceData.deceasesCommonPreviousDiseases,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                    child: Card(
                      child: Container(
                        child: TableData(
                          title: 'Municipios Afectados',
                          headers: ['Municipios', 'Fallecidos', '% del total'],
                          values: [
                            provinceData.deceasesAffectedMunicipalities
                                .map(
                                  (x) => x.name,
                                )
                                .toList(),
                            provinceData.deceasesAffectedMunicipalities
                                .map(
                                  (x) => x.value.toString(),
                                )
                                .toList(),
                            provinceData.deceasesAffectedMunicipalities
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
                        title:
                            'Comparación de los fallecidos acumulados por municipios',
                        subtitle: 'Fallecidos',
                        isDeceases: true,
                      ),
                    ),
                  ),
                  Container(padding: EdgeInsets.all(5)),
                ]),
    );
  }
}
