import 'package:covid19cuba/src/widgets/presentation_widget.dart';
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
          children: credits(context),
        ),
      ),
    );
  }

  List<Widget> credits(BuildContext context) {
    List<Widget> result = [];

    result.add(
      Container(
        child: Image.asset(Constants.appLogo),
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.only(
          top: 80,
          left: 110,
          right: 110,
        ),
      ),
    );

    result.add(
      Container(
        margin: EdgeInsets.only(
          top: 50,
          left: 50,
          right: 50,
          bottom: 20,
        ),
        child: Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod'
              ' tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, '
              'quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
          style: TextStyle(
            fontStyle: FontStyle.normal,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );

    result.add(Container(
      margin: EdgeInsets.only(
        top: 50,
        left: 50,
        right: 50,
        bottom: 20,
      ),
      child: Text(
        'Nuestro Equipo :',
        style: TextStyle(
          fontStyle: FontStyle.normal,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
      ),
    ));

    for (var collaborator in Constants.collaborators) {
      result.add(
        PresentationCard(
          name: collaborator[0],
          description: collaborator[1],
          link: collaborator[2],
        ),
      );
    }

    result.add(
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
          const url = 'http://www.matcom.uh.cu';
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            log('Could not launch $url');
          }
        },
      ),
    );

    result.add(
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
    );

    result.add(
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
    );

    result.add(
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
    );

    return result;
  }
}
