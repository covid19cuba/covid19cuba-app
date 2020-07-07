// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/blocs/blocs.dart';
import 'package:covid19cuba/src/models/charts/data.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getflutter/getflutter.dart';
import 'package:preferences/preference_service.dart';
import 'package:search_choices/search_choices.dart';

class CubaWidget extends StatefulWidget {
  final Data data;

  const CubaWidget({this.data}) : assert(data != null);

  @override
  CubaWidgetState createState() => CubaWidgetState();
}

class CubaWidgetState extends State<CubaWidget> {
  String mode;
  String province;
  String municipality;
  List<DropdownMenuItem> provinces;

  CubaWidgetState() {
    mode = PrefService.getString(Constants.prefModeSelected) ??
        Constants.modeGeneral;
    province = PrefService.getString(Constants.prefProvinceSelected);
    municipality = PrefService.getString(Constants.prefMunicipalitySelected);
    provinces = Constants.provinceAbbreviations.entries.map((item) {
      return DropdownMenuItem(
        child: Text(item.value),
        value: item.key,
      );
    }).toList();
  }

  Widget titleWidget(title) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Constants.primaryColor,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var municipalities = province == null
        ? List<DropdownMenuItem>()
        : Constants.municipalitiesNames.entries
            .where(
            (x) => x.value.startsWith(
              Constants.provinceAbbreviations[province],
            ),
          )
            .map((item) {
            return DropdownMenuItem(
              child: Text(
                item.value.substring(
                  Constants.provinceAbbreviations[province].length + 3,
                ),
              ),
              value: item.key,
            );
          }).toList();
    var list = List<Widget>();
    list.add(UpdateWidget(
      updated: mode == Constants.modeGeneral
          ? widget.data.all.updated
          : widget.data.all.deceasesUpdated,
    ));
    list.add(Container(
      margin: widget.data.all.note == null || widget.data.all.note.isEmpty
          ? EdgeInsets.all(0)
          : EdgeInsets.only(left: 5, right: 5, top: 5),
      child: Card(
        color: Colors.red,
        child: NoteWidget(note: widget.data.all.note),
      ),
    ));
    list.add(
      Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: GFButton(
                text: 'General',
                textColor: mode == Constants.modeGeneral
                    ? Colors.white
                    : Constants.primaryColor,
                textStyle: TextStyle(
                  fontStyle: FontStyle.normal,
                  color: mode == Constants.modeGeneral
                      ? Colors.white
                      : Constants.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                color: mode == Constants.modeGeneral
                    ? Constants.primaryColor
                    : Colors.transparent,
                shape: GFButtonShape.pills,
                type: mode == Constants.modeGeneral
                    ? GFButtonType.solid
                    : GFButtonType.outline2x,
                borderSide: BorderSide(
                  width: 2.0,
                  color: Constants.primaryColor,
                ),
                fullWidthButton: true,
                onPressed: () {
                  setState(() {
                    mode = Constants.modeGeneral;
                  });
                  PrefService.setString(
                      Constants.prefModeSelected, Constants.modeGeneral);
                  PrefService.setString(Constants.prefProvinceSelected, null);
                  PrefService.setString(
                      Constants.prefMunicipalitySelected, null);
                  BlocProvider.of<HomeBloc>(context).add(FetchHomeEvent());
                },
              ),
            ),
            Container(width: 10),
            Expanded(
              child: GFButton(
                text: 'Fallecidos',
                textColor: mode == Constants.modeDeceases
                    ? Colors.white
                    : Constants.primaryColor,
                textStyle: TextStyle(
                  fontStyle: FontStyle.normal,
                  color: mode == Constants.modeDeceases
                      ? Colors.white
                      : Constants.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                color: mode == Constants.modeDeceases
                    ? Constants.primaryColor
                    : Colors.transparent,
                shape: GFButtonShape.pills,
                type: mode == Constants.modeDeceases
                    ? GFButtonType.solid
                    : GFButtonType.outline2x,
                borderSide: BorderSide(
                  width: 2.0,
                  color: Constants.primaryColor,
                ),
                fullWidthButton: true,
                onPressed: () {
                  setState(() {
                    mode = Constants.modeDeceases;
                  });
                  PrefService.setString(
                      Constants.prefModeSelected, Constants.modeDeceases);
                  PrefService.setString(Constants.prefProvinceSelected, null);
                  PrefService.setString(
                      Constants.prefMunicipalitySelected, null);
                  BlocProvider.of<HomeBloc>(context).add(FetchHomeEvent());
                },
              ),
            ),
          ],
        ),
      ),
    );
    var filters = List<Widget>();
    filters.add(SearchChoices.single(
      items: provinces,
      value: province,
      onChanged: (value) {
        PrefService.setString(Constants.prefModeSelected, mode);
        PrefService.setString(Constants.prefProvinceSelected, value);
        PrefService.setString(Constants.prefMunicipalitySelected, null);
        BlocProvider.of<HomeBloc>(context).add(FetchHomeEvent());
      },
      hint: Container(
        margin: EdgeInsets.all(10),
        child: Text('Seleccione una provincia'),
      ),
      searchHint: 'Seleccione una provincia',
      closeButton: (sel) => 'Cerrar',
      isExpanded: true,
      isCaseSensitiveSearch: false,
    ));
    filters.add(SearchChoices.single(
      items: municipalities,
      value: municipality,
      onChanged: (value) {
        PrefService.setString(Constants.prefModeSelected, mode);
        PrefService.setString(Constants.prefProvinceSelected, province);
        PrefService.setString(Constants.prefMunicipalitySelected, value);
        setState(() {
          municipality = value;
        });
      },
      hint: Container(
        margin: EdgeInsets.all(10),
        child: Text('Seleccione un municipio'),
      ),
      searchHint: 'Seleccione un municipio',
      closeButton: (sel) => 'Cerrar',
      isExpanded: true,
      isCaseSensitiveSearch: false,
      readOnly: province == null,
    ));
    list.add(Container(
      margin: EdgeInsets.only(left: 5, right: 5, top: 5),
      child: Card(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            children: filters,
          ),
        ),
      ),
    ));
    if (mode == Constants.modeGeneral) {
      if (province == null) {
        list.add(NationalWidget(data: widget.data));
        list.insert(2, titleWidget('Cuba'));
      } else if (municipality == null) {
        list.add(ProvinceWidget(data: widget.data, province: province));
        list.insert(2, titleWidget(Constants.provinceAbbreviations[province]));
      } else {
        list.add(MunicipalityWidget(
          data: widget.data.getMunicipality(municipality).all,
        ));
        list.insert(
          2,
          titleWidget(Constants.municipalitiesCodes[municipality]),
        );
      }
    } else if (mode == Constants.modeDeceases) {
      if (province == null) {
        list.add(DeceasesNationalWidget(data: widget.data));
        list.insert(2, titleWidget('Cuba'));
      } else if (municipality == null) {
        list.add(DeceasesProvinceWidget(data: widget.data, province: province));
        list.insert(2, titleWidget(Constants.provinceAbbreviations[province]));
      } else {
        list.add(DeceasesMunicipalityWidget(
          data: widget.data.getMunicipality(municipality).all,
        ));
        list.insert(
          2,
          titleWidget(Constants.municipalitiesCodes[municipality]),
        );
      }
    }
    return ListView(children: list);
  }
}
