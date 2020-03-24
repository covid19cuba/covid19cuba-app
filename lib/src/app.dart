import 'package:flutter/material.dart';

import 'package:covid19cuba/src/pages/pages.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid19 Cuba',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark().copyWith(
        accentColor: Colors.white,
      ),
      home: HomePage(),
    );
  }
}
