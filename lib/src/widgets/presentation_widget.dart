import 'dart:math';
import 'package:flutter/material.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                //leading: Icon(Icons),
                title: Text(
                  this.name,
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  this.description,
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
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
    if (this.link != '' && await canLaunch(this.link) ){
      await launch(this.link);
    }
    else{
      print("empty link or url issue");
    }
  }

}
