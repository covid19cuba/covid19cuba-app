import 'dart:developer';

import 'package:covid19cuba/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoDialogWidget extends StatelessWidget {
  String title;
  String text;

  InfoDialogWidget({this.title, this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(Icons.info),
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
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Constants.primaryColor,
                      fontSize: 12,
                    ),
                    linkStyle: TextStyle(
                      color: Constants.primaryColor,
                      fontSize: 12,
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
                      child: Text('Cerrar'),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ],
              );
            });
      },
    );
  }
}
