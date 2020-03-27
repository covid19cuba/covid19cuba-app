import 'package:flutter/material.dart';

import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/widgets/widgets.dart';

class HomeWidget extends StatelessWidget {
  final DataModel data;
  final WorldTotalsModel countries;

  const HomeWidget({this.data, this.countries})
      : assert(data != null),
        assert(countries != null);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          color: Constants.primaryColor,
          child: ResumeWidget(data: data),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            color: Colors.red,
            child: NoteWidget(data: data),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: EvolutionWidget(data: data),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: DistributionNationalityDiagnosedWidget(
              data: data,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: DistributionAgeGroupsDiagnosedWidget(
              data: data,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: PieSexWidget(data: data),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: PieContagionWidget(data: data),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: ComparisonWidget(data: data, countries: countries),
          ),
        ),
        Container(padding: EdgeInsets.all(5)),
      ],
    );
  }
}
