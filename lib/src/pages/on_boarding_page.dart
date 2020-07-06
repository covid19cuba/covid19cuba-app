// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:preferences/preferences.dart';

import 'package:covid19cuba/src/pages/pages.dart';
import 'package:covid19cuba/src/utils/utils.dart';

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
          body: 'Visualice los datos relacionados con la Covid-19 en Cuba a '
              'partir de la información oficial del MINSAP que es reportada '
              'al día siguiente',
          image: buildImage(context, 'logo.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: 'Pesquisador Virtual',
          body: 'Realice la autopesquisa con el pesquisador virtual '
              'oficial del Ministerio de Salud de Cuba',
          image: buildImage(context, 'carousel/pesquisador.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: 'Cuba y el mundo',
          body: 'Compare la situación de la pandemia provocada por la '
              'Covid-19 de Cuba con otros países del mundo',
          image: buildImage(context, 'carousel/cuba_vs_world.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: 'Cuba en detalles',
          body: 'Manténgase al tanto de la situación no solo del país en '
              'general, sino de cada provincia y municipio, con '
              'un gran número de gráficos y estadísticas',
          image: buildImage(context, 'carousel/cuba_info.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: 'Información',
          body: 'Revise la información y los consejos obtenidos de fuentes '
              'oficiales sobre el Sars-Cov-2, la Covid-19 y cómo combatirla',
          image: buildImage(context, 'carousel/info_and_tips.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: 'Noticias',
          body: 'Lea las noticias sobre la Covid-19 de fuentes nacionales '
              'como Juventud Técnica, la Agencia Cubana de Noticias, '
              'Cubadebate, entre otras',
          image: buildImage(context, 'carousel/news.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: 'Protocolos',
          body: 'Infórmese sobre los protocolos de actuación que contribuyen '
              'a la prevención, control y manejo de los casos relacionados '
              'con la enfermedad',
          image: buildImage(context, 'carousel/protocols.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: 'Boletines',
          body: 'Acceda a los boletines especiales enfocados en la '
              'Covid-19 del Centro de Estudios Demográficos (CEDEM) de la '
              'Universidad de La Habana',
          image: buildImage(context, 'carousel/bulletins.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: 'Registro de Contactos',
          body: 'Registre las personas con las que ha tenido contacto para '
              'mantener un registro a prueba de olvidos y, así, combatir la '
              'Covid-19 de una mejor forma',
          image: buildImage(context, 'carousel/manual_contact_tracing.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: 'Atención a la Población',
          body: 'Llame a las líneas de Atención a la Población de cada '
              'provincia para cualquier duda o inquietud que tenga sobre '
              'la situación actual provocada por la Covid-19',
          image: buildImage(context, 'carousel/attention_numbers.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: 'Contáctenos',
          body: 'Si tiene cualquier duda, sugerencia o comentario sobre la '
              'la aplicación contáctenos a través de nuestro grupo de '
              'Telegram @covid19cubadatachat',
          image: buildImage(context, 'carousel/telegram.png'),
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
      skip: Text(
        'Saltar',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      showSkipButton: true,
      dotsDecorator: DotsDecorator(
        spacing: EdgeInsets.all(1),
        size: Size(5, 5),
        color: Colors.white,
        activeColor: Colors.white,
        activeSize: Size(5, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
      ),
    );
  }
}
