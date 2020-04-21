import 'package:flutter/cupertino.dart';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/widgets/widgets.dart';
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
          top: 90,
          left: 110,
          right: 110,
        ),
      ),
    );

    result.add(
      creditsText(
        text: "Equipo de Desarrollo:",
        topMargin: 70.0,
        bottomMargin: 60.0,
        style: TextStyle(
          fontStyle: FontStyle.normal,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );

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
      creditsText(
        text: 'Colaboradores: ',
        topMargin: 50.0,
        style: TextStyle(
          fontStyle: FontStyle.normal,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );

    result.add(
      LinkText(
        "CUSOBU",
        "https://www.cusobu.nat.cu",
        topMargin: 20.0,
      ),
    );

    result.add(
      LinkText(
        "Daxslab",
        "https://www.daxslab.com",
      ),
    );

    result.add(
      LinkText(
        "Proyecto SWL-X",
        "https://www.swlx.info",
      ),
    );



    result.add(
      creditsText(
        text: 'Réplicas de nuestro sitio web: ',
        topMargin: 50.0,
        style: TextStyle(
          fontStyle: FontStyle.normal,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );

    for (var replc in Constants.replicas) {
      result.add(
        Replica(
          collaboratorText: replc[0],
          url: replc[1],
          collaboratorUrl: replc[2],
          topMargin: 20,
        ),
      );
    }

    result.add(
      creditsText(
        text: 'Agradecimientos: ',
        topMargin: 50.0,
        style: TextStyle(
          fontStyle: FontStyle.normal,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );


    result.add(creditsText(
      text: 'Muela aca',
      topMargin: 20.0,
    ));

    result.add(
      GestureDetector(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 70),
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

Widget creditsText(
    {@required text,
    align = TextAlign.center,
    style = const TextStyle(
      fontStyle: FontStyle.normal,
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    leftMargin: 50.0,
    rightMargin: 50.0,
    topMargin: 0.0,
    bottomMargin: 20.0}) {
  return ContainerizedText(
    text: text,
    style: style,
    align: align,
    leftMargin: leftMargin,
    rightMargin: rightMargin,
    topMargin: topMargin,
    bottomMargin: bottomMargin,
  );
}

Widget LinkText(
  String text,
  String url, {
  leftMargin: 50.0,
  rightMargin: 50.0,
  topMargin: 10.0,
  bottomMargin: 30.0,
}) {
  Text txt = Text(
    text,
    textAlign: TextAlign.center,
    style: const TextStyle(
      fontStyle: FontStyle.normal,
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
  );

  return TouchableUrlWidget(
    txt,
    url,
    leftMargin: leftMargin,
    rightMargin: rightMargin,
    topMargin: topMargin,
    bottomMargin: bottomMargin,
  );
}
