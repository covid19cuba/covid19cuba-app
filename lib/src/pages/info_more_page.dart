// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/widgets/widgets.dart';

class InfoMorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*final width = MediaQuery.of(context).size.width;*/
    return Scaffold(
      appBar: AppBar(
        title: Text('Información'),
        centerTitle: true,
      ),
      //backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.only(bottom: 10),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              InfoCard(
                title: '¿Qué es la Covid-19?',
                content:
                    'La Covid-19 es la enfermedad infecciosa causada por el '
                    'coronavirus descubierto más recientemente. '
                    'Este nuevo virus y enfermedad eran desconocidos '
                    'antes de que comenzara el brote en Wuhan, China, '
                    'en diciembre de 2019. La Covid-19 es ahora una '
                    'pandemia que afecta a muchos países a nivel '
                    'mundial.',
              ),
              InfoCard(
                title: '¿Cómo se propaga?',
                content: 'Las personas pueden contraer la Covid-19 de otras '
                    'personas que tienen el virus. La enfermedad se propaga '
                    'principalmente de persona a persona a través de pequeñas '
                    'gotas de la nariz o la boca, que se expulsan cuando una '
                    'persona con Covid-19 tose, estornuda o habla. Estas gotas '
                    'son relativamente pesadas, no viajan lejos y se hunden '
                    'rápidamente en el suelo. Las personas pueden atrapar la '
                    'Covid-19 si respiran estas gotas de una persona infectada '
                    'con el virus. Por eso es importante mantenerse al menos a '
                    '1 metro (3 pies) de distancia de los demás. Estas gotitas '
                    'pueden caer sobre objetos y superficies alrededor de la '
                    'persona, como mesas, pomos y pasamanos. Las personas '
                    'pueden infectarse al tocar estos objetos o superficies y '
                    'luego tocarse los ojos, la nariz o la boca. Es por eso '
                    'que es importante lavarse las manos regularmente con agua '
                    'y jabón o limpiar con un desinfectante para manos a base '
                    'de alcohol.',
              ),
              InfoCard(
                title: 'Signos y síntomas',
                content: 'Los síntomas más comunes de la Covid-19 son fiebre, '
                    'tos seca y cansancio. Algunos pacientes pueden tener '
                    'dolores y molestias, congestión nasal, dolor de garganta '
                    'o diarrea. Estos síntomas generalmente son leves y '
                    'comienzan gradualmente.',
              ),
              Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: <Widget>[
                      smallCardContainer(
                        'assets/images/dolor_cabeza.svg',
                        'Dolor\nde cabeza',
                        context,
                      ),
                      Container(
                        width: 5,
                      ),
                      smallCardContainer(
                        'assets/images/dolor_garganta.svg',
                        'Dolor\nde garganta',
                        context,
                      ),
                      Container(
                        width: 5,
                      ),
                      smallCardContainer(
                        'assets/images/tos.svg',
                        'Tos\n',
                        context,
                      ),
                      Container(
                        width: 5,
                      ),
                      smallCardContainer(
                        'assets/images/fiebre.svg',
                        'Fiebre\n',
                        context,
                      ),
                      Container(
                        width: 5,
                      ),
                      smallCardContainer(
                        'assets/images/falta_aire.svg',
                        'Dificultad\npara respirar',
                        context,
                      ),
                    ],
                  ),
                ),
              ),
              InfoCard(
                title: 'Tratamiento',
                content: 'Hasta la fecha, no hay vacuna ni medicamentos '
                    'antivirales específicos contra la Covid-19. Sin embargo, '
                    'las personas, particularmente aquellas con enfermedades '
                    'graves, pueden necesitar hospitalización para que puedan '
                    'recibir un tratamiento que les salve la vida por '
                    'complicaciones. La mayoría de los pacientes se recuperan '
                    'gracias a esa atención.',
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    'Prevención',
                    style: Constants.kTitleTextStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: <Widget>[
                    SmallCard(
                      imgPath: 'assets/images/clean_hands.svg',
                      imgTitle: 'Lave sus manos',
                      desc: 'Lávese las manos con agua y jabón antes de '
                          'tocar cualquier cosa, incluidos los ojos, la '
                          'nariz y la boca.',
                    ),
                    SmallCard(
                      imgPath: 'assets/images/distance_keep_social.png',
                      imgTitle: 'Distancia social',
                      desc: 'Quédese en casa. Evite las multitudes y el '
                          'contacto con otras personas o animales. Practique '
                          'el distanciamiento social y evite las reuniones.',
                    ),
                    SmallCard(
                      imgPath: 'assets/images/man_mask.svg',
                      imgTitle: 'Use mascarilla',
                      desc: 'La mascarilla bloquea la emisión de gotas '
                          'infectadas lo que ayuda a reducir la transmisión '
                          'comunitaria del coronavirus.',
                    ),
                    SmallCard(
                      imgPath: 'assets/images/avoid_contact_handshake.png',
                      imgTitle: 'Evitar el apretón de manos',
                      desc: 'Evite los apretones de manos, choques de manos, '
                          'contactos corporales y el contacto con otras '
                          'superficies.',
                    ),
                    SmallCard(
                      imgPath: 'assets/images/cleaning_soap.svg',
                      imgTitle: 'Desinfecte sus manos',
                      desc: 'En caso de que no haya agua y jabón, use '
                          'siempre un desinfectante para manos a base de '
                          'alcohol siempre que toque algo.',
                    ),
                    SmallCard(
                      imgPath: 'assets/images/casa.png',
                      imgTitle: 'Quédate en casa',
                      desc: 'Si está enfermo, quédese en casa y si no tiene '
                          'nada que hacer afuera, quédese en casa para '
                          'salvar vidas.',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget smallCardContainer(String imgPath, String imgTitle, context) {
  return Card(
    child: Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Center(
            child: imgPath.endsWith('.svg')
                ? SvgPicture.asset(imgPath, height: 90)
                : Image.asset(imgPath, height: 90),
          ),
          Container(height: 10),
          Center(
            child: Text(
              imgTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'Ubuntu',
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class InfoCard extends StatelessWidget {
  final String content;
  final String title;

  const InfoCard({Key key, this.content, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                left: 15,
              ),
              child: Center(
                child: Text(
                  title,
                  style: Constants.kTitleTextStyle,
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.all(5),
          child: Card(
            child: Container(
              margin: EdgeInsets.all(10),
              child: Text(
                content,
                style: Constants.moreDescStyle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
