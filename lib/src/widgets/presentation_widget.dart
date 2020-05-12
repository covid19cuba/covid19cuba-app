// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:covid19cuba/src/utils/utils.dart';

class PresentationCard extends StatelessWidget {
  const PresentationCard(
      {@required this.name,
      @required this.description,
      @required this.link,
      this.leftMargin: 0,
      this.rightMargin: 0,
      this.topMargin: 0,
      this.bottomMargin: 0});

  final String name;
  final String description;
  final String link;
  final double leftMargin;
  final double rightMargin;
  final double topMargin;
  final double bottomMargin;

  @override
  Widget build(
    BuildContext context,
  ) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(
          left: leftMargin,
          right: rightMargin,
          top: topMargin,
          bottom: bottomMargin,
        ),
        child: Card(
          borderOnForeground: false,
          color: Constants.primaryColor,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      //leading: Icon(Icons),
                      title: Text(
                        name,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        description,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Icon(
                  Icons.keyboard_arrow_right,
                  color: link == null || link == ''
                      ? Colors.transparent
                      : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: _launchURL,
    );
  }

  _launchURL() async {
    if (link != '' && await canLaunch(link)) {
      await launch(link);
    } else {
      print("empty link or url issue");
    }
  }
}
