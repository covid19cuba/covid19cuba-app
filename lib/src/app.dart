// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:preferences/preference_service.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:covid19cuba/src/pages/pages.dart';
import 'package:covid19cuba/src/utils/utils.dart';

class App extends StatelessWidget {
  final bool update;

  const App(this.update) : assert(update != null);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Constants.primaryColor));
    var isOnBoarding = PrefService.getBool(Constants.prefIsOnBoarding) ?? false;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('es', 'ES'),
      ],
      title: Constants.appName,
      theme: AppTheme.themeLight,
      home: isOnBoarding
          ? (update ? UpdatePage() : HomePage())
          : OnBoardingPage(update),
    );
  }
}
