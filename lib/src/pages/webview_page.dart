import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/utils/utils.dart';

class WebViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WebViewPageState();
}

class WebViewPageState extends State<WebViewPage>
    with AutomaticKeepAliveClientMixin {
  WebView webView;
  WebViewController controller;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    var json = PrefService.getString(Constants.prefPesquisador) ??
        Constants.defaultPesquisador;
    var data = PesquisadorModel.fromJson(jsonDecode(json));
    webView = WebView(
      initialUrl: data.url,
      javascriptMode: JavascriptMode.unrestricted,
      onPageFinished: (_) {
        controller.evaluateJavascript(data.javascript).whenComplete(() {});
      },
      navigationDelegate: (request) {
        if (request.url.contains(data.contains)) {
          return NavigationDecision.navigate;
        }
        return NavigationDecision.prevent;
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
    var json = PrefService.getString(Constants.prefPesquisador) ??
        Constants.defaultPesquisador;
    var data = PesquisadorModel.fromJson(jsonDecode(json));
    return WillPopScope(
      onWillPop: () async {
        if (controller != null &&
            await controller.canGoBack() &&
            await controller.currentUrl() != data.url) {
          controller.goBack();
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Pesquisador Virtual'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                if (controller != null) {
                  controller.reload();
                }
              },
            ),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        body: webView,
      ),
    );
  }
}
