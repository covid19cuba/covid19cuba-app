library flutter_echarts;

// --- FIX_BLINK ---
import 'dart:io' show Platform;
// --- FIX_BLINK ---

import 'package:flutter/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/foundation.dart';

import 'package:webview_flutter/webview_flutter.dart';

import 'echarts_script.dart' show echartsScript;

/// <!DOCTYPE html><html><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0, target-densitydpi=device-dpi" /><style type="text/css">body,html,#chart{height: 100%;width: 100%;margin: 0px;}div {-webkit-tap-highlight-color:rgba(255,255,255,0);}</style></head><body><div id="chart" /></body></html>
/// 'data:text/html;base64,' + base64Encode(const Utf8Encoder().convert( /* STRING ABOVE */ ))

class Echarts extends StatefulWidget {
  Echarts({
    Key key,
    @required this.option,
    this.extraScript = '',
    this.onMessage,
    this.extensions = const [],
    this.theme,
    this.captureAllGestures = false,
    this.onLoad,
  }) : super(key: key);

  final String option;

  final String extraScript;

  final void Function(String message) onMessage;

  final List<String> extensions;

  final String theme;

  final bool captureAllGestures;

  final void Function() onLoad;

  @override
  _EchartsState createState() => _EchartsState();
}

class _EchartsState extends State<Echarts> {
  WebViewController _controller;

  String _currentOption;

  // --- FIX_BLINK ---
  double _opacity = Platform.isAndroid ? 0.0 : 1.0;
  // --- FIX_BLINK ---

  @override
  void initState() {
    super.initState();
    _currentOption = widget.option;
  }

  void init() async {
    final extensionsStr = this.widget.extensions.length > 0
        ? this
            .widget
            .extensions
            .reduce((value, element) => (value ?? '') + '\n' + (element ?? ''))
        : '';
    final themeStr =
        this.widget.theme != null ? '\'${this.widget.theme}\'' : 'null';
    await _controller?.evaluateJavascript('''
      $echartsScript
      $extensionsStr
      var chart = echarts.init(document.getElementById('chart'), $themeStr);
      ${this.widget.extraScript}
      chart.setOption($_currentOption, true);
    ''');
    if (widget.onLoad != null) {
      widget.onLoad();
    }
  }

  void update(String preOption) async {
    _currentOption = widget.option;
    if (_currentOption != preOption) {
      await _controller?.evaluateJavascript('''
        try {
          chart.setOption($_currentOption, true);
        } catch(e) {
        }
      ''');
    }
  }

  @override
  void didUpdateWidget(Echarts oldWidget) {
    super.didUpdateWidget(oldWidget);
    update(oldWidget.option);
  }

  // --- FIX_IOS_LEAK ---
  @override
  void dispose() {
    if (Platform.isIOS) {
      _controller.clearCache();
    }
    super.dispose();
  }
  // --- FIX_IOS_LEAK ---

  @override
  Widget build(BuildContext context) {
    // --- FIX_BLINK ---
    return Opacity(
        opacity: _opacity,
        // --- FIX_BLINK ---
        child: WebView(
          initialUrl: 'flutter_echarts/assets/echart.html',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller = webViewController;
          },
          onPageFinished: (String url) {
            // --- FIX_BLINK ---
            if (Platform.isAndroid) {
              setState(() {
                _opacity = 1.0;
              });
            }
            // --- FIX_BLINK ---
            init();
          },
          javascriptChannels: <JavascriptChannel>[
            JavascriptChannel(
                name: 'Messager',
                onMessageReceived: (JavascriptMessage javascriptMessage) {
                  widget?.onMessage(javascriptMessage.message);
                }),
          ].toSet(),
          gestureRecognizers: widget.captureAllGestures
              ? (Set()
                ..add(Factory<VerticalDragGestureRecognizer>(() {
                  return VerticalDragGestureRecognizer()
                    ..onStart = (DragStartDetails details) {}
                    ..onUpdate = (DragUpdateDetails details) {}
                    ..onDown = (DragDownDetails details) {}
                    ..onCancel = () {}
                    ..onEnd = (DragEndDetails details) {};
                }))
                ..add(Factory<HorizontalDragGestureRecognizer>(() {
                  return HorizontalDragGestureRecognizer()
                    ..onStart = (DragStartDetails details) {}
                    ..onUpdate = (DragUpdateDetails details) {}
                    ..onDown = (DragDownDetails details) {}
                    ..onCancel = () {}
                    ..onEnd = (DragEndDetails details) {};
                })))
              : null,
        ));
  }
}
