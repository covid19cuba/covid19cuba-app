// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/pages/pages.dart';
import 'package:covid19cuba/src/widgets/widgets.dart';

class InfoPage extends StatefulWidget {
  @override
  InfoPageState createState() => InfoPageState();
}

class InfoPageState extends State<InfoPage> {
  final controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      controller: controller,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InfoHeader(
            image: 'assets/images/doctor.svg',
            textTop: 'Conozca acerca',
            textBottom: 'de la Covid-19',
            offset: offset,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Text(
                    'Síntomas principales',
                    style: Constants.kTitleTextStyle,
                  ),
                ),
              ],
            ),
          ),
          Container(height: 10),
          Container(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  smallCardContainer(
                    'assets/images/dolor_cabeza.svg',
                    'Dolor\nde cabeza',
                    context,
                  ),
                  Container(
                    width: 5,
                  ),
                  smallCardContainer(
                    'assets/images/dolor_garganta.svg',
                    'Dolor\nde garganta',
                    context,
                  ),
                  Container(
                    width: 5,
                  ),
                  smallCardContainer(
                    'assets/images/tos.svg',
                    'Tos\n',
                    context,
                  ),
                  Container(
                    width: 5,
                  ),
                  smallCardContainer(
                    'assets/images/fiebre.svg',
                    'Fiebre\n',
                    context,
                  ),
                  Container(
                    width: 5,
                  ),
                  smallCardContainer(
                    'assets/images/falta_aire.svg',
                    'Dificultad\npara respirar',
                    context,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              color: Constants.primaryColor,
              child: Container(
                margin: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'No salga de casa\n'
                          'Así detendremos a la Covid-19\n'
                          '#QuédateEnCasa',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => InfoMorePage(),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 20),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.red,
                            ),
                            child: Text(
                              'Saber más',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(width: 30),
                    Flexible(
                      child: Image.asset(
                        'assets/images/casa.png',
                        width: width * 0.2,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    'Prevención',
                    style: Constants.kTitleTextStyle,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  smallCardContainer(
                    'assets/images/clean_hands.svg',
                    'Lave\nsus manos',
                    context,
                  ),
                  Container(
                    width: 5,
                  ),
                  smallCardContainer(
                    'assets/images/man_mask.svg',
                    'Use\nmascarilla',
                    context,
                  ),
                  Container(
                    width: 5,
                  ),
                  smallCardContainer(
                    'assets/images/dont_face_touch.svg',
                    'No se toque\nla cara',
                    context,
                  ),
                  Container(
                    width: 5,
                  ),
                  smallCardContainer(
                    'assets/images/distance_keep_social.png',
                    'Distancia\nsocial',
                    context,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget smallCardContainer(String imgPath, String imgTitle, context) {
    return Card(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Center(
              child: imgPath.endsWith('.svg')
                  ? SvgPicture.asset(imgPath, height: 90)
                  : Image.asset(imgPath, height: 90),
            ),
            Container(height: 10),
            Center(
              child: Text(
                imgTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Ubuntu',
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
