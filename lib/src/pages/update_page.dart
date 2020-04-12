import 'package:covid19cuba/src/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:preferences/preferences.dart';
import 'dart:developer';
import 'package:covid19cuba/src/utils/utils.dart';

class UpdatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: Text('Actualización'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                left: 50,
                right: 50,
              ),
              child: Text(
                'Ya esta disponible una nueva actualización de nuestra aplicación. '
                'Es posible adquirir nuestra nueva actualización desde la red nacional cubana'
                ' con akplis o desde internet en Github.',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 50,
                right: 50,
                top: 50,
              ),
              child: GestureDetector(
                child: Image.asset("assets/images/apklis.png"),
                onTap: () => GetUrl(context, Constants.apklisUrl),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 50,
                right: 50,
                top: 20,
              ),
              child: GestureDetector(
                child: Image.asset("assets/images/github.png"),
                onTap: () => GetUrl(context, Constants.githubUrl),
              ),
            ),
          ],
        ));
  }
}

void GetUrl(BuildContext context, url) async {
  if (await canLaunch(url)) {
    launch(url);
  } else {
    log("Download url failed");
  }
}
