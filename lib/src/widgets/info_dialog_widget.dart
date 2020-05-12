// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:covid19cuba/src/utils/utils.dart';

class InfoDialogWidget extends StatelessWidget {
  final String title;
  final String text;

  InfoDialogWidget({this.title, this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(Icons.info, color: Constants.primaryColor.withOpacity(0.54)),
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: Container(
                margin: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                child: Linkify(
                  text: text,
                  options: LinkifyOptions(humanize: true),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Constants.primaryColor,
                    fontSize: 14,
                  ),
                  linkStyle: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
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
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    'Cerrar',
                    style: TextStyle(
                      color: Constants.primaryColor,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
