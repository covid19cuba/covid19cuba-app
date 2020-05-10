// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/widgets/widgets.dart';

class MunicipalityWidget extends StatelessWidget {
  final MunicipalityModel data;

  const MunicipalityWidget({this.data}) : assert(data != null);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
            Container(
              color: Constants.primaryColor,
              child: ResumeWidget(resume: data.resume, updated: data.updated),
            ),
          ] +
          (data.resume.map((a) => a.value).reduce((a, b) => a + b) == 0
              ? []
              : <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                    child: Card(
                      child: PieSexWidget(casesBySex: data.casesBySex),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                    child: Card(
                      child: PieContagionWidget(
                        casesByModeOfContagion: data.casesByModeOfContagion,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                    child: Card(
                      child: EvolutionCasesWidget(
                        evolutionOfCasesByDays: data.evolutionOfCasesByDays,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                    child: Card(
                      child: DistributionAgeGroupsDiagnosedWidget(
                        distributionByAgeRanges: data.distributionByAgeRanges,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                    child: Card(
                      child: PieCasesNationalityWidget(
                        casesByNationality: data.casesByNationality,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                    child: Card(
                      child: DistributionNationalityDiagnosedWidget(
                        distributionByNationalityOfForeignCases:
                            data.distributionByNationalityOfForeignCases,
                      ),
                    ),
                  ),
                  Container(padding: EdgeInsets.all(5)),
                ]),
    );
  }
}
