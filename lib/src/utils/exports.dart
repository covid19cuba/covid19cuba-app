import 'dart:io';

import 'package:covid19cuba/src/models/contact/contact.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:grizzly_io/grizzly_io.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;

List<List<String>> getCsvList(List<Contact> contacts) {
  List<List<String>> data = new List();
  data.add(['Nombre', 'Fecha', 'Lugar']);
  contacts.forEach((item) {
    data.add([item.name, item.date.toStrPlus(), item.place]);
  });
  return data;
}

Future<File> exportToCsv(List<Contact> contacts) async {
  final directory = await getExternalStorageDirectory();
  final data = getCsvList(contacts);
  final file = File('${directory.path}/contactos.csv');
  return file.writeAsString('${encodeCsv(data)}');
}

Future<File> exportToPdf(List<Contact> data) async {
  final directory = await getExternalStorageDirectory();
  final pdf = pw.Document();
  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Column(
          children: [
            pw.Header(text: 'Registro de Contactos'),
            pw.Table(
              children: [
                    pw.TableRow(
                      children: <pw.Widget>[
                        pw.Container(
                          child: pw.Text('Nombre'),
                        ),
                        pw.Container(
                          child: pw.Text('Fecha'),
                        ),
                        pw.Container(
                          child: pw.Text('Lugar'),
                        ),
                      ],
                    ),
                    pw.TableRow(
                      children: <pw.Widget>[
                        pw.Divider(),
                        pw.Divider(),
                        pw.Divider(),
                      ],
                    )
                  ] +
                  data.map((contact) {
                    return pw.TableRow(
                      children: <pw.Widget>[
                        pw.Container(
                          child: pw.Text(contact.name),
                        ),
                        pw.Container(
                          child: pw.Text(contact.date.toStrPlus()),
                        ),
                        pw.Container(
                          child: pw.Text(contact.place),
                        ),
                      ],
                    );
                  }).toList(),
            ),
          ],
        );
      },
    ),
  );
  final file = File('${directory.path}/contactos.pdf');
  return file.writeAsBytes(pdf.save());
}
