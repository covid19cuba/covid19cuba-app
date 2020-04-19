import 'package:getflutter/getflutter.dart';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class CreditsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: Center(
        child: ListView(
          children: [

            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 40),
                child: Text(
                  'MatCom',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              onTap: () async {
                Navigator.pop(context);
                const url = 'https://http://www.matcom.uh.cu';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  log('Could not launch $url');
                }
              },
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Text(
                  'Postdata.club',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              onTap: () async {
                Navigator.pop(context);
                const url = 'https://www.postdata.club';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  log('Could not launch $url');
                }
              },
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Text(
                  'Juventud Técnica',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              onTap: () async {
                Navigator.pop(context);
                const url = 'https://medium.com/juventud-técnica';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  log('Could not launch $url');
                }
              },
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Copyright 2020',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                  Container(padding: EdgeInsets.all(2)),
                  Icon(Icons.copyright, color: Colors.white),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
