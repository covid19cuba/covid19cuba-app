
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import 'package:covid19cuba/src/utils/functions.dart';
import 'package:covid19cuba/src/models/contact_model.dart';

List<List<String>> getCsvList(List<ContactModel> contacts){

  List<List<String>> data = new List();
  data.add(['Nombre', 'Fecha', 'Lugar']);
  contacts.forEach((item){
    data.add([item.name, item.date.toStrPlus(), item.place]);
  });
  return data;
}

Future<File> exportToCsv(String data) async {

  final directory = await getExternalStorageDirectory();
  final localPath = directory.path;
  final file      = File('$localPath/contactos.csv');
  return file.writeAsString('$data');
}
