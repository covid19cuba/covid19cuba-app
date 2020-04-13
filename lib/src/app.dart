import 'package:flutter/material.dart';
import 'package:preferences/preference_service.dart';

import 'package:covid19cuba/src/pages/pages.dart';
import 'package:covid19cuba/src/utils/utils.dart';

class App extends StatelessWidget {
  final bool update;

  const App(this.update) : assert(update != null);

  @override
  Widget build(BuildContext context) {
    var isOnBoarding = PrefService.getBool(Constants.prefIsOnBoarding) ?? false;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: AppTheme.themeLight,
      home: isOnBoarding
          ? (update ? UpdatePage() : HomePage())
          : OnBoardingPage(update),
    );
  }
}
