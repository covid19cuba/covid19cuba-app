// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/models/charts/data.dart';
import 'package:covid19cuba/src/models/charts/province.dart';
import 'package:covid19cuba/src/utils/call_to_action.dart';
import 'package:covid19cuba/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProvinceWidget extends StatefulWidget {
  final Data data;
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
  final Data data;
  final String province;
  Province provinceData;

  ProvinceWidgetState({this.data, this.province}) {
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
                child: ResumeWidget(resume: provinceData.resume),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 5, right: 5, top: 5),
              child: Card(
                child: ProvinceMapWebViewWidget(
                  mapData: provinceData.mapData,
                  eventsData: data.all.events,
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
                    margin: provinceData.effectiveReproductiveNumber == null
                        ? EdgeInsets.all(0)
                        : EdgeInsets.only(left: 5, right: 5, top: 5),
                    child: provinceData.effectiveReproductiveNumber == null
                        ? Container()
                        : Card(
                            child: EffectiveReproductiveNumberWidget(
                              effectiveReproductiveNumber:
                                  provinceData.effectiveReproductiveNumber,
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
