import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:preferences/preferences.dart';

import 'package:covid19cuba/src/pages/pages.dart';
import 'package:covid19cuba/src/utils/utils.dart';

import '../utils/constants.dart';

class OnBoardingPage extends StatefulWidget {
  final bool update;

  const OnBoardingPage(this.update) : assert(update != null);

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void onIntroEnd(context) {
    PrefService.setBool(Constants.prefIsOnBoarding, true);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => widget.update ? UpdatePage() : HomePage(),
      ),
    );
  }

  Widget buildImage(BuildContext context, String assetName) {
    var size = MediaQuery.of(context).size;
    return Align(
      child: Image.asset('assets/images/$assetName', width: size.width / 2),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    var bodyStyle = TextStyle(
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
    var pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.all(20),
      pageColor: Constants.primaryColor,
      imagePadding: EdgeInsets.only(top: 10, bottom: 10),
    );

    return IntroductionScreen(
      globalBackgroundColor: Constants.primaryColor,
      key: introKey,
      pages: [
        PageViewModel(
          title: '',
          body: 'Podrá consultar en tiempo real los datos de la evolución '
              'de la epidemia de la ${Constants.diseaseName} en Cuba.',
          image: buildImage(context, 'logo.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: 'Recomendación',
          body: 'Lávese las manos a fondo y con frecuencia con agua y '
              'jabón o usando un desinfectante a base de alcohol.',
          image: buildImage(context, 'advice1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: 'Recomendación',
          body: 'Las manos tocan muchas superficies y pueden recoger '
              'virus. Una vez contaminadas pueden transferir '
              'el virus a los ojos, la nariz o la boca. Desde allí, el '
              'virus puede entrar en su cuerpo.',
          image: buildImage(context, 'advice2.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: 'Recuerde',
          body: 'Si todos seguimos las orientaciones de las autoridades '
              'de salud ganaremos la batalla contra la epidemia de '
              'la ${Constants.diseaseName}.',
          image: buildImage(context, 'advice3.png'),
          decoration: pageDecoration,
          footer: Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: GFButton(
              text: 'Entendido',
              textColor: Colors.white,
              color: Colors.white,
              size: GFSize.LARGE,
              shape: GFButtonShape.pills,
              type: GFButtonType.outline2x,
              fullWidthButton: true,
              onPressed: () {
                onIntroEnd(context);
              },
            ),
          ),
        ),
      ],
      onDone: () => onIntroEnd(context),
      next: Icon(
        Icons.arrow_forward,
        color: Colors.white,
      ),
      done: Text(
        'Listo',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      dotsDecorator: DotsDecorator(
        size: Size(10, 10),
        color: Colors.white,
        activeColor: Colors.white,
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
      ),
    );
  }
}
