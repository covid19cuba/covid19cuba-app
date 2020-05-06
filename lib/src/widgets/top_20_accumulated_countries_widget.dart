import 'package:flutter/material.dart';

import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/widgets/widgets.dart';

class Top20CountriesWidget extends StatefulWidget {

  final List<ItemExtended> top20AccumulatedCountries;
  final DateTime updated;

  Top20CountriesWidget({this.top20AccumulatedCountries, this.updated})
      : assert(top20AccumulatedCountries != null, updated != null);
  
  @override
  _Top20CountriesWidgetState createState() => _Top20CountriesWidgetState(top20AccumulatedCountries: top20AccumulatedCountries, updated: updated);
}

class _Top20CountriesWidgetState extends State<Top20CountriesWidget> {

  List<ItemExtended> top20AccumulatedCountries;
  final DateTime updated;
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  //true represents descending order 
  bool _isConfirmedSorted = true;
  bool _isRecoveredSorted = false;
  bool _isDeathsSorted = false;

  int _sortColumnIndex = 1;
  bool _sortAscending = true;

   _Top20CountriesWidgetState({this.top20AccumulatedCountries, this.updated})
      : assert(top20AccumulatedCountries != null, updated != null);

  
  @override
  Widget build(BuildContext context) {
    // var borderSide = BorderSide(
    //  color: Constants.primaryColor,
    //  width: 1,
    //);
    if (top20AccumulatedCountries == null ||
        top20AccumulatedCountries.length == 0) {
      return Container();
    }
    //Map<int, TableColumnWidth> col = {
    //  0: FlexColumnWidth(0.3),
    //  1: FlexColumnWidth(1),
    //  2: FlexColumnWidth(1),
    //};
    //var index = 0;
    var dts = _DTS(top20AccumulatedCountries: top20AccumulatedCountries);
    return PaginatedDataTable(
    sortColumnIndex: _sortColumnIndex,
    sortAscending: _sortAscending,  
    header:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Text(
              'Top 20 de países con más casos acumulados',
              textAlign: TextAlign.center,
              maxLines: 3,
              style: TextStyle(
                color: Constants.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          InfoDialogWidget(
            title: 'Top 20 de países con más casos acumulados',
            text: 'Datos de los países tomados '
                'de\nhttps://github.com/pomber/covid19\ny '
                'actualizado el '
                '${updated.toStrPlus()}',
          )
        ],
    ),
    
    columns: [
    DataColumn(
      label: Text('País'),          
      numeric: false,

    ),
    DataColumn(
      label: Text('Casos',
      ),
      numeric: true,
      
      onSort: ((a, b){
        setState(() {
          if(_isConfirmedSorted) {
            _isConfirmedSorted = false;
            _sortAscending = false;
            top20AccumulatedCountries.sort((x,y) => x.confirmed.compareTo(y.confirmed));
          }
          else {
            _isConfirmedSorted = true;
            _sortAscending = true;
            top20AccumulatedCountries.sort((x,y) => y.confirmed.compareTo(x.confirmed));
          }
          _sortColumnIndex = 1;
        });
      })
    ),
    DataColumn(
      label: Text('Recuperados'),
      numeric: true, 
      onSort: ((a,b){
        setState(() {
          if(_isRecoveredSorted) {
            _isRecoveredSorted = false;
            _sortAscending = false;
            top20AccumulatedCountries.sort((x,y) => x.recovered.compareTo(y.recovered));
          }
          else {
            _isRecoveredSorted = true;
            _sortAscending = true;
            top20AccumulatedCountries.sort((x,y) => y.recovered.compareTo(x.recovered));
          }
          _sortColumnIndex = 2;
        });
      })

    ),
    DataColumn(
      label: Text('Fallecidos'),
      numeric: true,
      onSort: ((a,b){
        setState(() {
          if(_isDeathsSorted) {
            _isDeathsSorted = false;
            _sortAscending = false;
            top20AccumulatedCountries.sort((x,y) => x.deaths.compareTo(y.deaths));
          }
          else {
            _isDeathsSorted = true;
            _sortAscending = true;
            top20AccumulatedCountries.sort((x,y) => y.deaths.compareTo(x.deaths));
          }
          _sortColumnIndex = 3;
        });
      })
      
    ),
    ], 
    source: dts,
    columnSpacing: 1.5,
    horizontalMargin: 2.5,
    rowsPerPage: _rowsPerPage,
    
      );
  }
}

class _DTS extends DataTableSource{

  List<ItemExtended> top20AccumulatedCountries;

  _DTS({this.top20AccumulatedCountries})
    :assert(top20AccumulatedCountries != null);

  @override
DataRow getRow(int index) => DataRow.byIndex(
                      index: index,
                      cells: [
                    DataCell(Container( 
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.all(5),
                      child: Text(
                        '${top20AccumulatedCountries[index].name}',
                        style: TextStyle(
                          color: Constants.primaryColor,
                          fontWeight: FontWeight.normal,
                          fontSize: 11,
                        ),
                      ),
                    )),
                    DataCell(Container( 
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.all(5),
                      child: Center( 
                        child: Text( 
                          '${top20AccumulatedCountries[index].confirmed}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Constants.primaryColor,
                            fontWeight: FontWeight.normal,
                            fontSize: 11
                          ),
                        ),
                      ),
                    )),
                    DataCell(Container( 
                      margin: EdgeInsets.all(5),
                      child: Center( 
                        child: Text( 
                          '${top20AccumulatedCountries[index].recovered}',
                          style: TextStyle(
                            color: Constants.primaryColor,
                            fontWeight: FontWeight.normal,
                            fontSize: 11
                          ),
                        ),
                      ),
                    )),
                    DataCell(Container( 
                      margin: EdgeInsets.all(5),
                      child: Center( 
                        child: Text( 
                          '${top20AccumulatedCountries[index].deaths}',
                          style: TextStyle(
                            color: Constants.primaryColor,
                            fontWeight: FontWeight.normal,
                            fontSize: 11
                          ),
                        ),
                      ),
                    )),
                    ]);

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => top20AccumulatedCountries.length;

  @override
  int get selectedRowCount => 0;

}

