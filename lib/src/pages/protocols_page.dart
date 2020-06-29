// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/blocs/blocs.dart';
import 'package:covid19cuba/src/models/protocols/indication.dart';
import 'package:covid19cuba/src/models/protocols/protocol.dart';
import 'package:covid19cuba/src/models/protocols/protocols.dart';
import 'package:covid19cuba/src/models/protocols/protocols_state.dart';
import 'package:covid19cuba/src/pages/pages.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProtocolsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GeneralBloc.getProtocolsBloc(),
      child: ProtocolsPageWidget(),
    );
  }
}

class ProtocolsPageWidget extends PageWidget<Protocols, ProtocolsState> {
  ProtocolsPageWidget() : super(getWidgetLoaded, title: 'Protocolos');

  static Widget getWidgetLoaded(
    BuildContext context,
    LoadedGeneralState<Protocols> state,
  ) {
    return ProtocolsWidget(state.data?.protocols);
  }
}

class ProtocolsWidget extends StatefulWidget {
  final List<Protocol> protocols;

  ProtocolsWidget(this.protocols) : assert(protocols != null);

  @override
  ProtocolsWidgetState createState() => ProtocolsWidgetState();
}

class ProtocolsWidgetState extends State<ProtocolsWidget> {
  var index = 0;

  Protocol get protocol => widget.protocols[index];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 5),
          child: Text(
            'Evolución de los elementos principales de los protocolos '
            'de actuación en los distintos escenarios',
            style: TextStyle(color: Constants.primaryColor, fontSize: 16),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2.5),
          width: MediaQuery.of(context).size.width,
          child: Card(
            color: Colors.grey[50],
            child: Container(
              margin: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  Center(
                    child: Text(
                      'Leyenda',
                      style: TextStyle(
                        color: Constants.primaryColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Wrap(
                    children: [
                      'producido',
                      'nacional',
                      'importado',
                      'actualización',
                    ]
                        .map(
                          (e) => Card(
                            elevation: 0,
                            child: Container(
                              margin: EdgeInsets.all(5),
                              child: Text(
                                e,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            color: getIndicationColor(
                              Indication()..category = e,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2.5),
          child: Card(
            color: Colors.grey[50],
            child: Column(children: <Widget>[
              Center(
                child: Text(
                  'Seleccione el protocolo',
                  style: TextStyle(
                    color: Constants.primaryColor,
                    fontSize: 16,
                  ),
                ),
              ),
              Slider.adaptive(
                value: index + 1.0,
                onChanged: (value) {
                  setState(() {
                    index = value.toInt() - 1;
                  });
                },
                activeColor: Constants.primaryColor,
                min: 1,
                max: widget.protocols.length.toDouble(),
                divisions: widget.protocols.length - 1,
                label: 'Protocolo versión ${index + 1}',
              )
            ]),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2.5),
          child: Card(
            color: Colors.grey[50],
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Center(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    'Protocolo Versión ${protocol.version}',
                    style: TextStyle(color: Constants.primaryColor, fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ),
        if (protocol.date != null)
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 5),
            child: Center(
              child: Text(
                'Fecha: ${protocol.date.toStr()}',
                style: TextStyle(color: Constants.primaryColor, fontSize: 16),
              ),
            ),
          ),
        Column(
          children: protocol.indications.map((indication) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2.5),
              width: MediaQuery.of(context).size.width,
              child: Card(
                color: Colors.grey[50],
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: <Widget>[
                          if (indication.description != null &&
                              indication.description != '')
                            Tooltip(
                              message: indication.description,
                              child: Card(
                                color: indication.update
                                    ? Colors.redAccent
                                    : getIndicationColor(indication),
                                elevation: 0,
                                child: Card(
                                  elevation: 0,
                                  child: Container(
                                    margin: EdgeInsets.all(5),
                                    child: Text(
                                      indication.name,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  color: getIndicationColor(indication),
                                ),
                              ),
                            ),
                          if (indication.description == null ||
                              indication.description == '')
                            Card(
                              color: indication.update
                                  ? Colors.redAccent
                                  : getIndicationColor(indication),
                              elevation: 0,
                              child: Card(
                                elevation: 0,
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  child: Text(
                                    indication.name,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                color: getIndicationColor(indication),
                              ),
                            )
                        ] +
                        indication.scenarios.map((scenario) {
                          return Tooltip(
                            message: '${scenario.name}'
                                    '${scenario.details != null && scenario.details.length > 0 ? ':\n\n* ' : ''}' +
                                (scenario.details?.reduce(
                                      (value, element) => '$value\n* $element',
                                    ) ??
                                    ''),
                            child: Card(
                              color: scenario.update
                                  ? Colors.redAccent
                                  : Colors.grey,
                              elevation: 0,
                              child: Card(
                                elevation: 0,
                                child: Container(
                                  margin: EdgeInsets.all(3),
                                  child: Text(
                                    scenario.shortname,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                color: Colors.grey,
                              ),
                            ),
                          );
                        }).toList(),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        Container(height: 10),
      ],
    );
  }

  static Color getIndicationColor(Indication indication) {
    switch (indication.category) {
      case 'producido':
        return Colors.green;
      case 'nacional':
        return Colors.blue;
      case 'importado':
        return Colors.amber;
      case 'actualización':
        return Colors.redAccent;
      default:
        return Colors.white;
    }
  }
}
