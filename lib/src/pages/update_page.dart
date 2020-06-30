// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:developer';

import 'package:covid19cuba/src/models/charts/state_model.dart';
import 'package:getflutter/getflutter.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:preferences/preference_service.dart';

import 'package:covid19cuba/src/data_providers/data_providers.dart';
import 'package:covid19cuba/src/pages/pages.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/widgets/widgets.dart';

class UpdatePage extends StatefulWidget {
  final bool first;

  UpdatePage({this.first = true});

  @override
  UpdatePageState createState() => UpdatePageState();
}

class UpdatePageState extends State<UpdatePage> {
  bool loading = true;
  bool success = false;
  bool error = false;
  String version;

  UpdatePageState() {
    StateModel.check().then((stateList) {
      if (stateList == null) {
        setState(() {
          loading = false;
          success = false;
          error = true;
        });
      } else {
        if (stateList[0]) {
          setState(() {
            loading = false;
            success = true;
            error = false;
          });
        } else {
          setState(() {
            loading = false;
            success = false;
            error = false;
          });
        }
      }
    });
    PackageInfo.fromPlatform().then((x) {
      version = x.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Scaffold(
        backgroundColor: Constants.primaryColor,
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      if (success) {
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
                  'Actualización',
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
                  'Desde la red nacional cubana',
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
                () async {
                  var apklisUrl =
                      'https://www.apklis.cu/application/club.postdata.covid19cuba';
                  getUrl(apklisUrl);
                },
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
                  'Desde Internet',
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
                () async {
                  var gitHubUrl =
                      'https://github.com/covid19cuba/covid19cuba-app/releases';
                  getUrl(gitHubUrl);
                },
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
                  text: 'CAMBIOS REALIZADOS',
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
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => ChangelogPage(),
                      ),
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 50,
                  right: 50,
                  top: 5,
                ),
                child: GFButton(
                  text: 'SALIR',
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
                  onPressed: () async {
                    try {
                      var state = await getStateData();
                      if (state != null) {
                        PrefService.setInt(
                            Constants.prefVersionLastSkip, state.version);
                      }
                    } catch (e) {
                      log(e.toString());
                    }
                    if (widget.first) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) => HomePage(),
                        ),
                      );
                    } else {
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ),
            ],
          ),
        );
      } else {
        return Scaffold(
          backgroundColor: Constants.primaryColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image.asset(Constants.appLogo),
                padding: EdgeInsets.all(20),
                width: 200,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 50,
                  right: 50,
                  bottom: 20,
                  top: 20,
                ),
                child: Text(
                  'Versión: $version',
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 50,
                  right: 50,
                  bottom: 20,
                  top: 20,
                ),
                child: Text(
                  error
                      ? 'No se ha podido comprobar si hay actualización nueva. '
                          'Intentelo más tarde.'
                      : 'Tiene la última versión de la aplicación.',
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 50,
                  right: 50,
                  top: 5,
                ),
                child: GFButton(
                  text: 'SALIR',
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
                  onPressed: () {
                    PrefService.setBool(
                      Constants.prefFirstVersionNotification,
                      true,
                    );
                    if (widget.first) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) => HomePage(),
                        ),
                      );
                    } else {
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ),
            ],
          ),
        );
      }
    }
  }
}
