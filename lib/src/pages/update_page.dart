import 'dart:io';

import 'package:getflutter/getflutter.dart';
import 'package:covid19cuba/src/widgets/touchable_url_widget.dart';
import 'package:flutter/material.dart';
import 'package:covid19cuba/src/utils/utils.dart';

class UpdatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.primaryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                left: 50,
                right: 50,
                bottom: 20,
              ),
              child: Text(
                "Nueva Actualización",
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 50,
                right: 50,
              ),
              child: Text(
                Constants.apkUpdateText,
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            TouchableUrlImage(
              Constants.apklisBanner,
              Constants.apklisUrl,
              leftMargin: 50,
              rightMargin: 50,
              topMargin: 30,
            ),
            TouchableUrlImage(
              Constants.githubBanner,
              Constants.githubUrl,
              leftMargin: 50,
              rightMargin: 50,
              topMargin: 20,
            ),
            Container(
              margin: EdgeInsets.only(
                left: 50,
                right: 50,
                top: 30,
              ),
              child: GFButton(
                text: "Salir",
                textColor: Colors.white,
                textStyle: TextStyle(
                  fontStyle: FontStyle.normal,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                color: Constants.primaryColor,
                shape: GFButtonShape.pills,
                type: GFButtonType.outline2x,
                borderSide: BorderSide(width: 1.0, color: Colors.white),
                fullWidthButton: true,
                onPressed: () => exit(0),
              ),
            ),
          ],
        ));
  }
}
