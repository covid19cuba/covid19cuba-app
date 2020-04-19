import 'package:flutter/material.dart';

import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/widgets/widgets.dart';

class HomeWidget extends StatelessWidget {
  final DataModel data;

  const HomeWidget({this.data}) : assert(data != null);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          color: Constants.primaryColor,
          child: ResumeWidget(resume: data.resume, updated: data.updated),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            color: Colors.red,
            child: NoteWidget(note: data.note),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: MapWebViewWidget(mapData: data.mapData, eventsData: data.events),
          ),
        ),
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
            child: EvolutionRecoveredWidget(
              evolutionOfRecoveredByDays: data.evolutionOfRecoveredByDays,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: EvolutionDeathWidget(
              evolutionOfDeathsByDays: data.evolutionOfDeathsByDays,
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
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: PieTestsPercentWidget(
              listOfTestsPerformed: data.listOfTestsPerformed,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: TestEvolutionWidget(testsByDays: data.testsByDays),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: Container(
              child: TableData(
                title: 'TOP10 Provincias Afectadas',
                subtitle: 'Provincias',
                description: '% del total de casos',
                keys: data.affectedProvinces
                    .map(
                      (x) => x.name,
                    )
                    .take(10)
                    .toList(),
                values: data.affectedProvinces
                    .map(
                      (x) => (x.value * 100 / x.total).toStringAsFixed(2) + '%',
                    )
                    .take(10)
                    .toList(),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: Container(
              child: TableData(
                title: 'TOP10 Municipios Afectados',
                subtitle: 'Municipios',
                description: '% del total de casos',
                keys: data.affectedMunicipalities
                    .map(
                      (x) => '${x.name} (${x.province})',
                    )
                    .take(10)
                    .toList(),
                values: data.affectedMunicipalities
                    .map(
                      (x) => (x.value * 100 / x.total).toStringAsFixed(2) + '%',
                    )
                    .take(10)
                    .toList(),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: ComparisonWidget(
              comparisonOfAccumulatedCases: data.comparisonOfAccumulatedCases,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: Container(
              child: Top20CountriesWidget(
                top20AccumulatedCountries: data.top20AccumulatedCountries,
                updated: data.comparisonOfAccumulatedCases.updated,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: Container(
              child: CurvesEvolutionWidget(
                curvesEvolution: data.curvesEvolution,
                updated: data.comparisonOfAccumulatedCases.updated,
              ),
            ),
          ),
        ),
        Container(padding: EdgeInsets.all(5)),
      ],
    );
  }
}
