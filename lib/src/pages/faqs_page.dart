// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:developer';

import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:getflutter/getflutter.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/data_providers/faqs_provider.dart';

class FaqsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
        future: getFaqsData(),
        builder: (context, AsyncSnapshot<void> snapshot) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text('Preguntas Frecuentes'),
              centerTitle: true,
            ),
            backgroundColor: Constants.primaryColor,
            body: Center(
              child: ListView(
                children: faqs(),
              ),
            ),
          );
        });
  }

  List<Widget> faqs() {
    List<Widget> result = [];
    for (var faq in Constants.faqs) {
      result.add(GFAccordion(
        collapsedTitlebackgroundColor: Constants.primaryColor,
        expandedTitlebackgroundColor: Constants.primaryColor,
        contentbackgroundColor: Constants.primaryColor,
        textStyle: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        collapsedIcon: Icon(
          Icons.keyboard_arrow_down,
          color: Colors.white,
        ),
        expandedIcon: Icon(
          Icons.keyboard_arrow_up,
          color: Colors.white,
        ),
        title: faq[0],
        contentChild: Linkify(
          text: faq[1],
          options: LinkifyOptions(humanize: true),
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          linkStyle: TextStyle(
            color: Colors.red,
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
      ));
    }
    return result;
  }
}
