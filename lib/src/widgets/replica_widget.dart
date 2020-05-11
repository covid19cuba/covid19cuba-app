// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class Replica extends StatelessWidget {
  const Replica(
      {this.url,
      this.collaboratorUrl,
      this.collaboratorText,
      this.leftMargin: 0,
      this.rightMargin: 0,
      this.topMargin: 0,
      this.bottomMargin: 0});

  final String url;
  final String collaboratorUrl;
  final String collaboratorText;
  final double leftMargin;
  final double rightMargin;
  final double topMargin;
  final double bottomMargin;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      margin: EdgeInsets.only(
        left: leftMargin,
        right: rightMargin,
        top: topMargin,
        bottom: bottomMargin,
      ),
      child: GestureDetector(
        child: Column(
          children: <Widget>[
            Linkify(
              text: this.url,
              textAlign: TextAlign.center,
              linkStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              options: LinkifyOptions(humanize: true),
              onOpen: (link) async {
                if (await canLaunch(link.url)) {
                  await launch(link.url);
                } else {
                  log('Could not launch $link');
                }
              },
            ),
            Text(
              'cortesía de',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            GestureDetector(
              child: Text(
                this.collaboratorText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              onTap: () async {
                if (await canLaunch(this.collaboratorUrl)) {
                  await launch(this.collaboratorUrl);
                } else {
                  log('Could not launch $collaboratorUrl');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
