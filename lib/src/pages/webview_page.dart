import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
    webView = WebView(
      initialUrl: 'https://github.com',
      javascriptMode: JavascriptMode.unrestricted,
      navigationDelegate: (request) {
        if (request.url.contains('github.com')) {
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
    return WillPopScope(
      onWillPop: () async {
        if (controller != null && await controller.canGoBack()) {
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

class WebViewWidget extends StatefulWidget {
  WebViewWidget();

  @override
  WebViewWidgetState createState() => WebViewWidgetState();
}

class WebViewWidgetState extends State<WebViewWidget>
    with AutomaticKeepAliveClientMixin {
  WebView webView;
  WebViewController controller;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    webView = WebView(
      initialUrl: 'https://github.com',
      javascriptMode: JavascriptMode.unrestricted,
      onPageFinished: (_) {},
      navigationDelegate: (request) {
        log(request.url);
        if (request.url.contains('github.com')) {
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
    return Container(
      margin: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
      child: webView,
    );
  }
}
