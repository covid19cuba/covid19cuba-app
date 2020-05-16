
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

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

Future<File> exportToPdf(List<ContactModel> data) async {

  final directory = await getExternalStorageDirectory();
  final localPath = directory.path;
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) => pw.Table(  
      children: data.map((contact){
        return pw.TableRow(
          children: <pw.Widget>[
            pw.Container(
              child: pw.Text(contact.name),),
            pw.Container(
              child: pw.Text(contact.date.toStrPlus()),),
            pw.Container(
              child: pw.Text(contact.place),),
          ]
        );
      }).toList()
      ),
    ),
  );

  final file = File('$localPath/contactos.pdf');
  return file.writeAsBytes(pdf.save());
}
