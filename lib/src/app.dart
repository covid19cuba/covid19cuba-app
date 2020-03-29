import 'package:flutter/material.dart';
import 'package:preferences/preference_service.dart';

import 'package:covid19cuba/src/pages/pages.dart';
import 'package:covid19cuba/src/utils/utils.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var isOnBoarding = PrefService.getBool(Constants.isOnBoarding) ?? false;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: AppTheme.themeLight,
      home: isOnBoarding ? HomePage() : OnBoardingPage(),
    );
  }
}
