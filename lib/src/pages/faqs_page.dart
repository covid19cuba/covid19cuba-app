import 'package:getflutter/getflutter.dart';
import 'package:flutter/material.dart';
import 'package:covid19cuba/src/utils/utils.dart';

class FaqsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preguntas Frecuentes"),
        centerTitle: true,
      ),
      backgroundColor: Constants.primaryColor,
      body: Center(
        child: ListView(
          children: faqs(),
        ),
      ),
    );
  }

  List<Widget> faqs() {
    List<Widget> result = [];
    for (var faq in Constants.faqs) {
      result.add(GFAccordion(
        title: faq[0],
        content: faq[1],
      ));
    }
    return result;
  }
}
