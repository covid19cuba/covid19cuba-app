import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:covid19cuba/src/utils/utils.dart';

class WebViewKeepAlive extends StatefulWidget {
  final Map<String, dynamic> mapData;
  final Map<String, dynamic> eventsData;
  final String jsCommand;

  WebViewKeepAlive({this.mapData, this.eventsData, this.jsCommand});

  @override
  WebViewKeepAliveState createState() => WebViewKeepAliveState();
}

class WebViewKeepAliveState extends State<WebViewKeepAlive>
    with AutomaticKeepAliveClientMixin {
  WebView webView;
  WebViewController controller;
  String mapData = "{}";
  String eventsData = "{}";

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    webView = WebView(
      initialUrl: 'assets/map.html',
      javascriptMode: JavascriptMode.unrestricted,
      onPageFinished: (_) {
        mapData = jsonEncode(widget.mapData);
        eventsData = jsonEncode(widget.eventsData);
        controller
            .evaluateJavascript(widget.jsCommand + '($mapData, $eventsData)')
            .whenComplete(() {});
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
        controller = webViewController;
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    webView = null;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      height: 250,
      margin: EdgeInsets.only(left: 0, right: 0, top: 0),
      child: webView,
    );
  }
}

class MapWebViewWidget extends StatefulWidget {
  final Map<String, dynamic> mapData;
  final Map<String, dynamic> eventsData;

  MapWebViewWidget({this.mapData, this.eventsData}) : assert(mapData != null);

  @override
  MapWebViewWidgetState createState() => MapWebViewWidgetState();
}

class MapWebViewWidgetState extends State<MapWebViewWidget> {
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
        WebViewKeepAlive(
          mapData: widget.mapData,
          eventsData: widget.eventsData,
          jsCommand: Constants.showMunicipalities,
        ),
        Container(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Eventos de transmisión local activos',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Constants.primaryColor,
                fontSize: 10,
              ),
            ),
            Container(
              child: Image.asset('assets/images/marker-icon-2x-gold.png'),
              width: 15,
              height: 15,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Eventos de transmisión local cerrados',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Constants.primaryColor,
                fontSize: 10,
              ),
            ),
            Container(
              child: Image.asset('assets/images/marker-icon-2x-green.png'),
              width: 15,
              height: 15,
            ),
          ],
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
        WebViewKeepAlive(
          mapData: widget.mapData,
          eventsData: widget.eventsData,
          jsCommand: Constants.showProvinces,
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
