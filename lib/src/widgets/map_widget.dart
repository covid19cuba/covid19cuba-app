import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
  WebViewController contMunicipalities;
  WebViewController contProvinces;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Center(
            child: Text(
              'Distribución por Municipios',
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
              contMunicipalities
                  .evaluateJavascript('covidData($mapData)')
                  .whenComplete(
                () {
                  contMunicipalities.evaluateJavascript(showMunicipalities);
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
              contMunicipalities = webViewController;
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Center(
            child: Text(
              'Distribución por Provincias',
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
              contProvinces
                  .evaluateJavascript('covidData($mapData)')
                  .whenComplete(
                () {
                  contProvinces.evaluateJavascript(showProvinces);
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
              contProvinces = webViewController;
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
          child: Center(
            child: Text(
              'El cuadrado representa aquellos que por distintas razones '
              'no tengan localización conocida.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Constants.primaryColor,
                fontSize: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
