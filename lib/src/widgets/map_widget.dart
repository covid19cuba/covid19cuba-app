import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/models/data_model.dart';

const showMunicipalities = "\$('#map-pro').hide();\$('#map-num').show();";
const showProvinces = "\$('#map-mun').hide();\$('#map-pro').show();";

class MapWebViewWidget extends StatefulWidget {
  final DataModel data;

  MapWebViewWidget({this.data}) : assert(data != null);

  @override
  MapWebViewWidgetState createState() => MapWebViewWidgetState();
}

class MapWebViewWidgetState extends State<MapWebViewWidget> {
  String mapData = "{}";
  WebViewController cont;
  String selectedView = 'Municipios';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Center(
            child: Text(
              'Distribución por $selectedView',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Constants.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
        Container(
          height: 250,
          margin: EdgeInsets.only(
            left: 0,
            right: 0,
            top: 0,
          ),
          child: WebView(
              initialUrl: 'assets/map.html',
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (_) {
                mapData = jsonEncode(widget.data.cases.toJson());
                cont.evaluateJavascript('covidData($mapData)').whenComplete(
                  () {
                    cont.evaluateJavascript(showMunicipalities).whenComplete(() {
                      setState(() {
                        selectedView = 'Municipios';
                      });
                    });
                  },
                );
              },
              gestureRecognizers: Set()
                ..add(
                  Factory<PanGestureRecognizer>(
                    () => PanGestureRecognizer(),
                  ),
                )
                ..add(
                  Factory<VerticalDragGestureRecognizer>(
                    () => VerticalDragGestureRecognizer(),
                  ),
                )
                ..add(
                  Factory<HorizontalDragGestureRecognizer>(
                    () => HorizontalDragGestureRecognizer(),
                  ),
                )
                ..add(
                  Factory<ScaleGestureRecognizer>(
                    () => ScaleGestureRecognizer(),
                  ),
                ),
              onWebViewCreated: (WebViewController webViewController) {
                cont = webViewController;
              }),
        ),
        ButtonBar(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            GFButton(
              text: 'Provincias',
              textColor: Constants.primaryColor,
              color: Constants.primaryColor,
              size: GFSize.LARGE,
              shape: GFButtonShape.pills,
              type: GFButtonType.outline2x,
              fullWidthButton: true,
              onPressed: () {
                cont.evaluateJavascript(showProvinces);
                setState(() {
                  selectedView = 'Provincias';
                });
              },
            ),
            GFButton(
              text: 'Municipios',
              textColor: Constants.primaryColor,
              color: Constants.primaryColor,
              size: GFSize.LARGE,
              shape: GFButtonShape.pills,
              type: GFButtonType.outline2x,
              fullWidthButton: true,
              onPressed: () {
                cont.evaluateJavascript(showMunicipalities);
                setState(() {
                  selectedView = 'Municipios';
                });
              },
            ),
            /*FlatButton(
              color: Constants.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              onPressed: () {
                cont.evaluateJavascript(showProvince);
                setState(() {
                  selectedView = 'Provincias';
                });
              },
              child: Text(
                'Provincias',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            FlatButton(
              color: Constants.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              onPressed: () {
                cont.evaluateJavascript(showMunicipality);
                setState(() {
                  selectedView = 'Municipios';
                });
              },
              child: Text(
                'Municipios',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),*/
          ],
        )
      ],
    );
  }
}
