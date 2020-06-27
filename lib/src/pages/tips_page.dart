// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:developer';

import 'package:covid19cuba/src/blocs/blocs.dart';
import 'package:covid19cuba/src/models/tips/tips.dart';
import 'package:covid19cuba/src/models/tips/tips_state.dart';
import 'package:covid19cuba/src/pages/pages.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:getflutter/getflutter.dart';
import 'package:url_launcher/url_launcher.dart';

class TipsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GeneralBloc.getTipsBloc(),
      child: TipsPageWidget(),
    );
  }
}

class TipsPageWidget extends PageWidget<Tips, TipsState> {
  TipsPageWidget() : super(getWidgetLoaded, title: 'Consejos y Respuestas');

  static Widget getWidgetLoaded(
    BuildContext context,
    LoadedGeneralState<Tips> state,
  ) {
    return Center(
      child: ListView(
        children: tips(state.data) + [Container(height: 15)],
      ),
    );
  }

  static List<Widget> tips(Tips data) {
    List<Widget> result = [];
    for (var tip in data.tips) {
      result.add(
        Card(
          child: GFAccordion(
            collapsedTitlebackgroundColor: Colors.white,
            expandedTitlebackgroundColor: Colors.white,
            contentbackgroundColor: Colors.white,
            textStyle: TextStyle(
              color: Constants.primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            collapsedIcon: Icon(
              Icons.keyboard_arrow_down,
              color: Constants.primaryColor,
            ),
            expandedIcon: Icon(
              Icons.keyboard_arrow_up,
              color: Constants.primaryColor,
            ),
            title: tip.header,
            contentChild: Linkify(
              text: tip.info,
              options: LinkifyOptions(humanize: true),
              style: TextStyle(
                color: Constants.primaryColor,
                fontSize: 16,
              ),
              linkStyle: TextStyle(
                color: Constants.primaryColor,
                fontSize: 16,
              ),
              onOpen: (link) async {
                if (await canLaunch(link.url)) {
                  await launch(link.url);
                } else {
                  log('Could not launch $link');
                }
              },
            ),
          ),
        ),
      );
    }
    return result;
  }
}
