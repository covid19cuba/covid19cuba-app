import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;

import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class CubaWidget extends StatelessWidget {
  final DataModel data;

  const CubaWidget({this.data}) : assert(data != null);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: Html(
              data:
                  """<figure><img alt=\"\" src=\"https://cdn-images-1.medium.com/max/1024/1*wZq4ObFCcOdtzy9UJTX4LA.jpeg\" /><figcaption>(Foto: tomada de <a href=\"https://news-coronavirus.it/\">news-coronavirus.it</a>)</figcaption></figure><p>El Dr. Francisco Dur\u00e1n Garc\u00eda, director nacional de Epidemiolog\u00eda del Ministerio de Salud P\u00fablica (MINSAP), en la conferencia que cada d\u00eda se ofrece para actualizar sobre la Covid 19, alert\u00f3 que no podemos confiarnos porque esta es una enfermedad de dif\u00edcil control, como ha sido demostrado.</p><p>De igual forma, precis\u00f3 que <strong>uno de los objetivos m\u00e1s importantes del personal de salud es realizar la mayor cantidad de pruebas (PCR en tiempo real y test r\u00e1pidos), para detectar a los portadores del SARS-CoV-2, incluso a los que no tengan s\u00edntomas </strong>y evitar que puedan haber complicaciones m\u00e9dicas, as\u00ed como prevenir que contin\u00faen trasmitiendo el\u00a0virus.</p><p><strong>Con respecto a la preocupaci\u00f3n que la comunidad cient\u00edfica internacional manifiesta ante la presencia del S\u00edndrome de Kawasaki en ni\u00f1os con Covid-19, el especialista manifest\u00f3 que en Cuba, no ha habido ning\u00fan paciente reportado con este padecimiento</strong> entre los 150 confirmados hasta el\u00a0momento.</p><p>\u201cEs una vasculitis sist\u00e9mica que provoca inflamaci\u00f3n en las paredes de las arterias medianas del cuerpo, sobre todo de las arterias coronarias. Puede incluir dolor abdominal, s\u00edntomas gastrointestinales, fiebre alta, hipotensi\u00f3n, erupci\u00f3n cut\u00e1nea y mucha dificultad para respirar. Ataca fundamentalmente a ni\u00f1os menores de cinco\u00a0a\u00f1os.</p><p>\u201cNo es frecuente encontrarla asociada a la Covid-19 ni a otros procesos infecciosos, aunque en distintos pa\u00edses se ha manifestado en estos pacientes. La han reportado Gran Breta\u00f1a, Italia, B\u00e9lgica, Francia y\u00a0Espa\u00f1a\u201d.</p><p>Seg\u00fan el Dr. Dur\u00e1n, <strong>que no haya sido reportada en la Isla asociada a los enfermos de coronavirus, no significa que los pediatras y m\u00e9dicos de familia no est\u00e9n atentos ante la posible aparici\u00f3n de los s\u00edntomas</strong>.</p><p>En relaci\u00f3n a la campa\u00f1a que el gobierno de los Estados Unidos mantiene contra las brigadas m\u00e9dicas cubanas que brindan su apoyo en varios pa\u00edses del mundo, el director nacional de Epidemiolog\u00eda del MINSAP expres\u00f3 que es parte de la manipulaci\u00f3n contra la Revoluci\u00f3n cubana.</p><p>\u201cEl papel altruista que desempe\u00f1a nuestro personal de salud, en lugares donde no va nadie es meritorio. Estuvieron en \u00c1frica cuando el \u00e9bola y ahora est\u00e1n combatiendo la Covid-19. Ese humanismo es una caracter\u00edstica de nuestro personal de\u00a0salud\u201d.</p><p>En Cuba se encuentran ingresados dos mil 897 pacientes, de ellos dos mil 110 sospechosos. Otras tres mil 892 personas se vigilan en sus hogares desde la Atenci\u00f3n Primaria de\u00a0Salud.</p><p><a href=\"https://salud.msp.gob.cu/?p=5032\">Parte de cierre del d\u00eda 30 de abril a las 12 de la noche</a></p><p>Fueron confirmados 36 nuevos enfermos de la Covid-19 para un total de mil 537 infectados en la Isla. De ellos 747 evolucionan de manera estable, seis pacientes se encuentran en estado cr\u00edtico, cuatro graves, se dieron 33 altas (714 hasta ahora) y hay 64 fallecidos.</p><p>A nivel internacional se reportan 183 pa\u00edses con Covid-19, con tres millones 130 mil 800 de personas confirmadas y 227 mil 51 fallecidas para una letalidad de 7,25 por\u00a0ciento.</p><p>En la regi\u00f3n de las Am\u00e9ricas hay un mill\u00f3n 293 mil 607 confirmados, el 41,32 por ciento del total de reportados en el mundo con 74 mil 591 fallecidos y una letalidad de\u00a05,7.</p><img src=\"https://medium.com/_/stat?event=post.clientViewed&referrerSource=full_rss&postId=e397d9ddc5b3\" width=\"1\" height=\"1\"><hr><p><a href=\"https://medium.com/juventud-t%C3%A9cnica/en-cuba-no-hay-reportes-del-s%C3%ADndrome-de-kaguasaki-e397d9ddc5b3\">En Cuba no hay reportes del S\u00edndrome de Kawasaki en ni\u00f1os</a> was originally published in <a href=\"https://medium.com/juventud-t%C3%A9cnica\">Juventud T\u00e9cnica</a> on Medium, where people are continuing the conversation by highlighting and responding to this story.</p>""",
              padding: EdgeInsets.all(10),
              onLinkTap: (url) async {
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  log('Could not launch $url');
                }
              },
            ),
          ),
        ),
        Container(
          color: Constants.primaryColor,
          child:
              ResumeWidget(resume: data.all.resume, updated: data.all.updated),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            color: Colors.red,
            child: NoteWidget(note: data.all.note),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: MapWebViewWidget(
                mapData: data.all.mapData, eventsData: data.all.events),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: PieSexWidget(casesBySex: data.all.casesBySex),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: PieContagionWidget(
              casesByModeOfContagion: data.all.casesByModeOfContagion,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: DistributionOfCasesWidget(
              distributionOfCases: data.all.distributionOfCases,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: EvolutionCasesWidget(
              evolutionOfCasesByDays: data.all.evolutionOfCasesByDays,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: EvolutionRecoveredWidget(
              evolutionOfRecoveredByDays: data.all.evolutionOfRecoveredByDays,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: EvolutionDeathWidget(
              evolutionOfDeathsByDays: data.all.evolutionOfDeathsByDays,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: DistributionAgeGroupsDiagnosedWidget(
              distributionByAgeRanges: data.all.distributionByAgeRanges,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: PieCasesNationalityWidget(
              casesByNationality: data.all.casesByNationality,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: DistributionNationalityDiagnosedWidget(
              distributionByNationalityOfForeignCases:
                  data.all.distributionByNationalityOfForeignCases,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: PieTestsPercentWidget(
              listOfTestsPerformed: data.all.listOfTestsPerformed,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: TestEvolutionWidget(testsByDays: data.all.testsByDays),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: TestsPositivePercentWidget(
              testsPositivePercent: data.all.testsPositivePercent,
            ),
          ),
        ),
        Container(
          margin: data.all.effectiveReproductiveNumber == null
              ? EdgeInsets.all(0)
              : EdgeInsets.only(left: 5, right: 5, top: 5),
          child: data.all.effectiveReproductiveNumber == null
              ? Container()
              : Card(
                  child: EffectiveReproductiveNumberWidget(
                    effectiveReproductiveNumber:
                        data.all.effectiveReproductiveNumber,
                  ),
                ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: StringencyIndexCubaWidget(
              stringencyIndexCuba: data.all.stringencyIndexCuba,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: Container(
              child: TableData(
                title: 'Provincias Afectadas',
                headers: [
                  'Provincias',
                  'Casos',
                  '% del total',
                  'Tasa (por 100 mil hab.)',
                ],
                values: [
                  data.all.affectedProvinces
                      .map(
                        (x) => x.name,
                      )
                      .toList(),
                  data.all.affectedProvinces
                      .map(
                        (x) => x.value.toString(),
                      )
                      .toList(),
                  data.all.affectedProvinces
                      .map(
                        (x) =>
                            (x.value * 100 / x.total).toStringAsFixed(2) + '%',
                      )
                      .toList(),
                  data.all.affectedProvinces
                      .map(
                        (x) => (x.value * 100000 / x.population)
                            .toStringAsFixed(2),
                      )
                      .toList(),
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: Container(
              child: TableData(
                title: 'TOP Municipios Afectados',
                headers: ['Municipios', 'Casos', '% del total'],
                values: [
                  data.all.affectedMunicipalities
                      .map(
                        (x) => '${x.name} (${x.province})',
                      )
                      .take(10)
                      .toList(),
                  data.all.affectedMunicipalities
                      .map(
                        (x) => x.value.toString(),
                      )
                      .take(10)
                      .toList(),
                  data.all.affectedMunicipalities
                      .map(
                        (x) =>
                            (x.value * 100 / x.total).toStringAsFixed(2) + '%',
                      )
                      .take(10)
                      .toList(),
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: ProvincesComparisonWidget(provinces: data.provinces),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Card(
            child: MunicipalitiesComparisonWidget(data: data),
          ),
        ),
        Container(padding: EdgeInsets.all(5)),
      ],
    );
  }
}
