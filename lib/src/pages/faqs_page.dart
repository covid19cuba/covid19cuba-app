// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:developer';

import 'package:covid19cuba/src/blocs/blocs.dart';
import 'package:covid19cuba/src/models/faqs/faqs.dart';
import 'package:covid19cuba/src/models/faqs/faqs_state.dart';
import 'package:covid19cuba/src/pages/pages.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:getflutter/getflutter.dart';
import 'package:url_launcher/url_launcher.dart';

class FaqsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GeneralBloc.getFaqsBloc(),
      child: FaqsPageWidget(),
    );
  }
}

class FaqsPageWidget extends PageWidget<Faqs, FaqsState> {
  FaqsPageWidget() : super(getWidgetLoaded, title: 'Preguntas Frecuentes');

  static Widget getWidgetLoaded(
      BuildContext context,
      LoadedGeneralState<Faqs> state,
      ) {
    return Center(
      child: ListView(
        children: faqs(state.data) + [Container(height: 15)],
      ),
    );
  }

  static List<Widget> faqs(Faqs data) {
    List<Widget> result = [];
    for (var tip in data.faqs) {
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
            title: tip.title,
            contentChild: Linkify(
              text: tip.body,
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
