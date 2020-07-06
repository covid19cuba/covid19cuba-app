// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.
import 'package:covid19cuba/src/models/charts/data.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeceasesNationalWidget extends StatelessWidget {
  final Data data;

  const DeceasesNationalWidget({this.data}) : assert(data != null);

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
            child: ResumeWidget(resume: data.all.deceasesResume),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: MapWebViewWidget(
              mapData: data.all.deceasesMapData,
              title: 'Fallecidos',
              titleMunicipality: 'Distribución de fallecidos por Municipios',
              titleProvince: 'Distribución de fallecidos por Provincias',
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: EvolutionDeathWidget(
              evolutionOfDeathsByDays: data.all.deceasesEvolutionByDays,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: PieSexWidget(
              casesBySex: data.all.deceasesBySex,
              title: 'Fallecidos',
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: DistributionAgeGroupsDeceasesWidget(
              distributionByAgeRanges: data.all.deceasesDistributionByAgeRanges,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: PieCasesNationalityWidget(
              casesByNationality: data.all.deceasesByNationality,
              title: 'Fallecidos',
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: PieDeceasesDistributionAmountDiseaseHistoryWidget(
              deceasesDistributionAmountDiseaseHistory:
                  data.all.deceasesDistributionAmountDiseaseHistory,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: DeceasesCommonPreviousDiseasesWidget(
              deceasesCommonPreviousDiseases:
                  data.all.deceasesCommonPreviousDiseases,
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
                  'Fallecidos',
                  '% del total',
                  'Tasa (por 100 mil hab.)',
                ],
                values: [
                  data.all.deceasesAffectedProvinces
                      .map(
                        (x) => x.name,
                      )
                      .toList(),
                  data.all.deceasesAffectedProvinces
                      .map(
                        (x) => x.value.toString(),
                      )
                      .toList(),
                  data.all.deceasesAffectedProvinces
                      .map(
                        (x) =>
                            (x.value * 100 / x.total).toStringAsFixed(2) + '%',
                      )
                      .toList(),
                  data.all.deceasesAffectedProvinces
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
                headers: ['Municipios', 'Fallecidos', '% del total'],
                values: [
                  data.all.deceasesAffectedMunicipalities
                      .map(
                        (x) => '${x.name} (${x.province})',
                      )
                      .take(10)
                      .toList(),
                  data.all.deceasesAffectedMunicipalities
                      .map(
                        (x) => x.value.toString(),
                      )
                      .take(10)
                      .toList(),
                  data.all.deceasesAffectedMunicipalities
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
            child: ProvincesComparisonWidget(
              provinces: data.provinces,
              title: 'Comparación de los fallecidos acumulados por provincias',
              subtitle: 'Fallecidos',
              isDeceases: true,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: MunicipalitiesComparisonWidget(
              data: data,
              title: 'Comparación de los fallecidos acumulados por municipios',
              subtitle: 'Fallecidos',
              isDeceases: true,
            ),
          ),
        ),
        Container(padding: EdgeInsets.all(5)),
      ],
    );
  }
}
