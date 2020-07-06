// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/widgets/widgets.dart';

class WebViewKeepAlive extends StatefulWidget {
  final Map<String, dynamic> mapData;
  final Map<String, dynamic> eventsData;
  final String jsCommand;
  final String title;

  WebViewKeepAlive({
    this.mapData,
    this.eventsData,
    this.jsCommand,
    this.title,
  });

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
        controller
            .evaluateJavascript("title = '${widget.title ?? 'Diagnosticados'}'")
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
  final String title;
  final String titleMunicipality;
  final String titleProvince;

  MapWebViewWidget({
    this.mapData,
    this.eventsData,
    this.title,
    this.titleMunicipality,
    this.titleProvince,
  }) : assert(mapData != null);

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Text(
                  widget.titleMunicipality ?? 'Distribución por Municipios',
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  style: TextStyle(
                    color: Constants.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              InfoDialogWidget(
                title:
                    widget.titleMunicipality ?? 'Distribución por Municipios',
                text:
                    'El cuadrado representa aquellos que por distintas razones '
                    'no tengan localización conocida.',
              )
            ],
          ),
        ),
        WebViewKeepAlive(
          mapData: widget.mapData,
          eventsData: widget.eventsData,
          jsCommand: Constants.showMunicipalities,
          title: widget.title,
        ),
        Container(
          height: 20,
        ),
        if (widget.eventsData != null)
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
        if (widget.eventsData != null)
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Text(
                  widget.titleProvince ?? 'Distribución por Provincias',
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  style: TextStyle(
                    color: Constants.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              InfoDialogWidget(
                title: widget.titleProvince ?? 'Distribución por Provincias',
                text:
                    'El cuadrado representa aquellos que por distintas razones '
                    'no tengan localización conocida.',
              )
            ],
          ),
        ),
        WebViewKeepAlive(
          mapData: widget.mapData,
          eventsData: widget.eventsData,
          jsCommand: Constants.showProvinces,
          title: widget.title,
        ),
        Container(height: 20),
      ],
    );
  }
}
