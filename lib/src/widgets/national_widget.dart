// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.
import 'package:covid19cuba/src/models/charts/data.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NationalWidget extends StatelessWidget {
  final Data data;

  const NationalWidget({this.data}) : assert(data != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: data.all.note == null || data.all.note == ''
              ? EdgeInsets.all(0)
              : EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            color: Colors.red,
            child: NoteWidget(note: data.all.note),
          ),
        ),
        if (shouldBe()) getWidget(context),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: ResumeWidget(resume: data.all.resume),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: MapWebViewWidget(
              mapData: data.all.mapData,
              eventsData: data.all.events,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: PieSexWidget(casesBySex: data.all.casesBySex),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: PieContagionWidget(
              casesByModeOfContagion: data.all.casesByModeOfContagion,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: EvolutionCasesWidget(
              evolutionOfCasesByDays: data.all.evolutionOfCasesByDays,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: EvolutionRecoveredWidget(
              evolutionOfRecoveredByDays: data.all.evolutionOfRecoveredByDays,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: EvolutionDeathWidget(
              evolutionOfDeathsByDays: data.all.evolutionOfDeathsByDays,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: DistributionOfCasesWidget(
              distributionOfCases: data.all.distributionOfCases,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: EvolutionCasesRecoveredWidget(
              evolutionOfCasesAndRecoveredByDays:
                  data.all.evolutionOfCasesAndRecoveredByDays,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: EvolutionActiveRecoveredWidget(
              evolutionOfActiveAndRecoveredAccumulated:
                  data.all.evolutionOfActiveAndRecoveredAccumulated,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: DistributionAgeGroupsDiagnosedWidget(
              distributionByAgeRanges: data.all.distributionByAgeRanges,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: PieCasesNationalityWidget(
              casesByNationality: data.all.casesByNationality,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: DistributionNationalityDiagnosedWidget(
              distributionByNationalityOfForeignCases:
                  data.all.distributionByNationalityOfForeignCases,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: PieTestsPercentWidget(
              listOfTestsPerformed: data.all.relationOfTestsPerformed,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: TestEvolutionWidget(testsByDays: data.all.testsByDays),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: TestsPositivePercentWidget(
              testsPositivePercent: data.all.percentPositiveTests,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: PieSymptomaticsAsymptomaticsWidget(
              percentSymptomaticsAsymptomatics:
                  data.all.percentSymptomaticsAsymptomatics,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: EvolutionSymptomaticsAsymptomaticsWidget(
              evolutionSymptomaticsAsymptomatics:
                  data.all.evolutionSymptomaticsAsymptomaticsDays,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: PercentEvolutionSymptomaticsAsymptomaticsDaysWidget(
              percentEvolutionSymptomaticsAsymptomatics:
                  data.all.percentEvolutionSymptomaticsAsymptomaticsDays,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: PercentEvolutionSymptomaticsAsymptomaticsAccumulatedWidget(
              percentEvolutionSymptomaticsAsymptomatics:
                  data.all.percentEvolutionSymptomaticsAsymptomaticsAccumulated,
            ),
          ),
        ),
        Container(
          margin: data.all.effectiveReproductiveNumber == null
              ? EdgeInsets.all(0)
              : EdgeInsets.only(left: 5, right: 5, top: 5),
          child: data.all.effectiveReproductiveNumber == null
              ? Container()
              : Card(
                  child: EffectiveReproductiveNumberWidget(
                    effectiveReproductiveNumber:
                        data.all.effectiveReproductiveNumber,
                  ),
                ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: StringencyIndexCubaWidget(
              stringencyIndexCuba: data.all.stringencyIndexCuba,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: Container(
              child: TableData(
                title: 'Provincias Afectadas',
                headers: [
                  'Provincias',
                  'Casos',
                  '% del total',
                  'Tasa (por 100 mil hab.)',
                ],
                values: [
                  data.all.affectedProvinces
                      .map(
                        (x) => x.name,
                      )
                      .toList(),
                  data.all.affectedProvinces
                      .map(
                        (x) => x.value.toString(),
                      )
                      .toList(),
                  data.all.affectedProvinces
                      .map(
                        (x) =>
                            (x.value * 100 / x.total).toStringAsFixed(2) + '%',
                      )
                      .toList(),
                  data.all.affectedProvinces
                      .map(
                        (x) => (x.value * 100000 / x.population)
                            .toStringAsFixed(2),
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
            child: Container(
              child: TableData(
                title: 'TOP Municipios Afectados',
                headers: ['Municipios', 'Casos', '% del total'],
                values: [
                  data.all.affectedMunicipalities
                      .map(
                        (x) => '${x.name} (${x.province})',
                      )
                      .take(10)
                      .toList(),
                  data.all.affectedMunicipalities
                      .map(
                        (x) => x.value.toString(),
                      )
                      .take(10)
                      .toList(),
                  data.all.affectedMunicipalities
                      .map(
                        (x) =>
                            (x.value * 100 / x.total).toStringAsFixed(2) + '%',
                      )
                      .take(10)
                      .toList(),
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: ProvincesComparisonWidget(provinces: data.provinces),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: MunicipalitiesComparisonWidget(data: data),
          ),
        ),
        Container(padding: EdgeInsets.all(5)),
      ],
    );
  }
}
