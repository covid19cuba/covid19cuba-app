import 'package:covid19cuba/src/pages/pages.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => HomePage()),
    );
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/images/$assetName', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0, color: Colors.white);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 28.0, fontWeight: FontWeight.w700, color: Colors.white),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Color.fromARGB(255, 28, 19, 64),
      imagePadding: EdgeInsets.only(top: 10),
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: Constants.appName,
          body:
              "Podrá consultar en tiempo real los datos de la evolución de la epidemia de COVID-19 en Cuba.",
          image: _buildImage('icon.jpg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Recomendación",
          body:
              "Lávese las manos a fondo y con frecuencia con agua y jabón o usando un desinfectante a base de alcohol.",
          image: _buildImage('advice1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Recomendación",
          body:
              "Las manos tocan muchas superficies y pueden recoger virus. Una vez contaminadas, las manos pueden transferir el virus a los ojos, la nariz o la boca. Desde allí, el virus puede entrar en su cuerpo y causarle la enfermedad.",
          image: _buildImage('advice2.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Recuerde",
          body:
              "Si todos seguimos las orientaciones de las autoridades de salud ganaremos la batalla contra la epidemia de COVID-19.",
          image: _buildImage('advice3.png'),
          decoration: pageDecoration,
          footer: RaisedButton(
            onPressed: () {
              // TODO(norlancd): save in share preferences.
              _onIntroEnd(context);
            },
            child: const Text(
              'Entendido',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.lightBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text(
        'Saltar',
        style: TextStyle(color: Colors.white),
      ),
      next: const Icon(
        Icons.arrow_forward,
        color: Colors.white,
      ),
      done: const Text('Listo',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
