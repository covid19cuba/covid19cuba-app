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
                "Actualización",
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
            Container(
              margin: EdgeInsets.only(
                left: 50,
                right: 50,
                top: 30,
              ),
              child: Text(
                "Desde la red nacional cubana",
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            TouchableUrlImage(
              Constants.apklisBanner,
              Constants.apklisUrl,
              leftMargin: 50,
              rightMargin: 50,
              topMargin: 5,
            ),
            Container(
              margin: EdgeInsets.only(
                left: 50,
                right: 50,
                top: 20,
              ),
              child: Text(
                "Desde Internet",
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            TouchableUrlImage(
              Constants.githubBanner,
              Constants.githubUrl,
              leftMargin: 50,
              rightMargin: 50,
              topMargin: 5,
            ),
            Container(
              margin: EdgeInsets.only(
                left: 50,
                right: 50,
                top: 30,
              ),
              child: GFButton(
                text: "CAMBIOS REALIZADOS",
                textColor: Colors.white,
                textStyle: TextStyle(
                  fontStyle: FontStyle.normal,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                color: Constants.primaryColor,
                shape: GFButtonShape.pills,
                type: GFButtonType.outline2x,
                borderSide: BorderSide(width: 1.0, color: Colors.white),
                fullWidthButton: true,
                //onPressed: , //TODO: Add onPressed function
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 50,
                right: 50,
                top: 5,
              ),
              child: GFButton(
                text: "SALIR",
                textColor: Colors.white,
                textStyle: TextStyle(
                  fontStyle: FontStyle.normal,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                color: Constants.primaryColor,
                shape: GFButtonShape.pills,
                type: GFButtonType.outline2x,
                borderSide: BorderSide(width: 1.0, color: Colors.white),
                fullWidthButton: true,
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ));
  }
}
