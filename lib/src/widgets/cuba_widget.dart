// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:preferences/preference_service.dart';
import 'package:search_choices/search_choices.dart';

import 'package:covid19cuba/src/blocs/blocs.dart';
import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/widgets/widgets.dart';

class CubaWidget extends StatefulWidget {
  final DataModel data;

  const CubaWidget({this.data}) : assert(data != null);

  @override
  CubaWidgetState createState() => CubaWidgetState();
}

class CubaWidgetState extends State<CubaWidget> {
  String province;
  String municipality;
  List<DropdownMenuItem> provinces;

  CubaWidgetState() {
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
      margin: EdgeInsets.only(left: 10, right: 10, top: 20),
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
    list.add(UpdateWidget(updated: widget.data.all.updated));
    var filters = List<Widget>();
    filters.add(SearchChoices.single(
      items: provinces,
      value: province,
      onChanged: (value) {
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
    if (province == null) {
      list.add(NationalWidget(data: widget.data));
      list.insert(1, titleWidget('Cuba'));
    } else if (municipality == null) {
      list.add(ProvinceWidget(data: widget.data, province: province));
      list.insert(1, titleWidget(Constants.provinceAbbreviations[province]));
    } else {
      list.add(MunicipalityWidget(
        data: widget.data.getMunicipality(municipality).all,
      ));
      list.insert(1, titleWidget(Constants.municipalitiesCodes[municipality]));
    }
    return ListView(children: list);
  }
}
