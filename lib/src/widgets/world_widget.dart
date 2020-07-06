// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.
import 'package:covid19cuba/src/models/charts/data.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/widgets/radar_widget.dart';
import 'package:covid19cuba/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class WorldWidget extends StatelessWidget {
  final Data data;

  const WorldWidget({this.data}) : assert(data != null);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        UpdateWidget(updated: data.all.updated),
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
            child: RadarChartWidget(
              data: data.all.multipleComparisonOfCubaWithRadar,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: ComparisonWidget(
              comparisonOfAccumulatedCases: data.all.curvesComparison,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: Container(
              child: TestBehaviorComparisonWidget(
                testBehaviorComparison: data.all.testBehaviorComparison,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: Container(
              child: CurvesEvolutionWidget(
                curvesEvolution: data.all.curvesEvolution,
                updated: data.all.curvesComparison.updated,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: WorldCountriesWidget(
            worldCountries: data.all.worldCountries,
            updated: data.all.curvesComparison.updated,
          ),
        ),
        Container(padding: EdgeInsets.all(5)),
      ],
    );
  }
}
