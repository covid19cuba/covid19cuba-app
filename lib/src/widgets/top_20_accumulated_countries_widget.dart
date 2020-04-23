import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/models/models.dart';

class Top20CountriesWidget extends StatelessWidget {
  final List<ItemExtended> top20AccumulatedCountries;
  final DateTime updated;

  const Top20CountriesWidget({this.top20AccumulatedCountries, this.updated})
      : assert(top20AccumulatedCountries != null, updated != null);

  @override
  Widget build(BuildContext context) {
    var borderSide = BorderSide(
      color: Constants.primaryColor,
      width: 1,
    );
    if (top20AccumulatedCountries == null ||
        top20AccumulatedCountries.length == 0) {
      return Container();
    }
    Map<int, TableColumnWidth> col = {
      0: FlexColumnWidth(0.3),
      1: FlexColumnWidth(1),
      2: FlexColumnWidth(1),
    };
    var index = 0;
    return Column(
      children: <Widget>[
        Table(
          children: [
            TableRow(
              children: [
                TableCell(
                  child: Container(
                    margin: EdgeInsets.all(15),
                    child: Center(
                      child: Text(
                        'Top 20 de países con más casos acumulados',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Constants.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Table(
          columnWidths: col,
          border: TableBorder(horizontalInside: borderSide),
          children: [
                TableRow(
                  children: [
                    TableCell(
                      child: Container(
                        margin: EdgeInsets.all(5),
                        child: Text(
                          '#',
                          style: TextStyle(
                            color: Constants.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.all(5),
                        child: Text(
                          'País',
                          style: TextStyle(
                            color: Constants.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        margin: EdgeInsets.all(5),
                        child: Center(
                          child: Text(
                            'Casos',
                            style: TextStyle(
                              color: Constants.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        margin: EdgeInsets.all(5),
                        child: Center(
                          child: Text(
                            'Recuperados',
                            style: TextStyle(
                              color: Constants.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        margin: EdgeInsets.all(5),
                        child: Center(
                          child: Text(
                            'Fallecidos',
                            style: TextStyle(
                              color: Constants.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ] +
              top20AccumulatedCountries.map(
                (item) {
                  index += 1;
                  return TableRow(
                    children: [
                      TableCell(
                        child: Container(
                          margin: EdgeInsets.all(5),
                          child: Text(
                            '$index',
                            style: TextStyle(
                              color: Constants.primaryColor,
                              fontWeight: FontWeight.normal,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.all(5),
                          child: Text(
                            '${DataModel.prettyCountry(item.name)}',
                            style: TextStyle(
                              color: Constants.primaryColor,
                              fontWeight: FontWeight.normal,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          margin: EdgeInsets.all(5),
                          child: Center(
                            child: Text(
                              '${item.confirmed}',
                              style: TextStyle(
                                color: Constants.primaryColor,
                                fontWeight: FontWeight.normal,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          margin: EdgeInsets.all(5),
                          child: Center(
                            child: Text(
                              '${item.recovered}',
                              style: TextStyle(
                                color: Constants.primaryColor,
                                fontWeight: FontWeight.normal,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          margin: EdgeInsets.all(5),
                          child: Center(
                            child: Text(
                              '${item.deaths}',
                              style: TextStyle(
                                color: Constants.primaryColor,
                                fontWeight: FontWeight.normal,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ).toList(),
        ),
        Container(
          margin: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: 20,
          ),
          child: Center(
            child: Linkify(
              text: 'Datos de los países tomados '
                  'de\nhttps://github.com/pomber/covid19\ny '
                  'actualizado el '
                  '${updated.toStrPlus()}',
              options: LinkifyOptions(humanize: true),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Constants.primaryColor,
                fontSize: 12,
              ),
              linkStyle: TextStyle(
                color: Constants.primaryColor,
                fontSize: 12,
              ),
              onOpen: (link) async {
                if (await canLaunch(link.url)) {
                  await launch(link.url);
                } else {
                  log('Could not launch $link');
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
