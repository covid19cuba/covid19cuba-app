import 'dart:async';

import 'package:flutter/material.dart';

import 'package:covid19cuba/src/pages/pages.dart';
import 'package:covid19cuba/src/utils/utils.dart';

class SplashPage extends StatefulWidget {
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      navigateFromSplash();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: Center(
        child: Container(
          child: Image.asset(Constants.appLogo),
          width: size.width / 3,
          height: size.width / 3,
        ),
      ),
    );
  }

  Future navigateFromSplash() async {
    var page = HomePage();
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}
