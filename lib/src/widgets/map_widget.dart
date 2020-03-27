import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:covid19cuba/src/utils/utils.dart';

class MapWebViewWidget extends StatelessWidget {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  WebViewController cont;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Center(
            child: Text(
              'Evolución en el tiempo',
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
          height: 300,
           margin: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
          ),
          // constraints: Constrains,
          child: WebView(
              initialUrl: 'assets/map.html',
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (_) {
                cont
                    .evaluateJavascript('covidData($basedata)')
                    .whenComplete(() => print('Mapa injected'));
              },
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
                cont = webViewController;
                cont
                    .evaluateJavascript('covidData($basedata)')
                    .whenComplete(() => print('Mapa injected'));

              }),
        ),

          IconButton(icon: Icon(Icons.desktop_windows), onPressed: (){cont
                  .evaluateJavascript("\$('#map-mun').hide();\$('#map-pro').show();");})
      ],
    );
  }
}