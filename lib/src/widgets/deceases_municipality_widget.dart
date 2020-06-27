// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.
import 'package:covid19cuba/src/models/charts/municipality.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DeceasesMunicipalityWidget extends StatelessWidget {
  final Municipality data;

  const DeceasesMunicipalityWidget({this.data}) : assert(data != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
            if (shouldBe()) getWidget(context),
            Container(
              margin: EdgeInsets.only(left: 5, right: 5, top: 5),
              child: Card(
                child: ResumeWidget(resume: data.deceasesResume),
              ),
            ),
          ] +
          (data.deceasesEvolutionByDays.accumulated.values.last == 0
              ? []
              : <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                    child: Card(
                      child: EvolutionDeathWidget(
                        evolutionOfDeathsByDays: data.deceasesEvolutionByDays,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                    child: Card(
                      child: PieSexWidget(
                        casesBySex: data.deceasesBySex,
                        title: 'Fallecidos',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                    child: Card(
                      child: DistributionAgeGroupsDeceasesWidget(
                        distributionByAgeRanges:
                            data.deceasesDistributionByAgeRanges,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                    child: Card(
                      child: PieCasesNationalityWidget(
                        casesByNationality: data.deceasesByNationality,
                        title: 'Fallecidos',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                    child: Card(
                      child: PieDeceasesDistributionAmountDiseaseHistoryWidget(
                        deceasesDistributionAmountDiseaseHistory:
                            data.deceasesDistributionAmountDiseaseHistory,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                    child: Card(
                      child: DeceasesCommonPreviousDiseasesWidget(
                        deceasesCommonPreviousDiseases:
                            data.deceasesCommonPreviousDiseases,
                      ),
                    ),
                  ),
                  Container(padding: EdgeInsets.all(5)),
                ]),
    );
  }
}
