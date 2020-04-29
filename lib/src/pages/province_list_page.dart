import 'package:flutter/material.dart';

import 'package:covid19cuba/src/pages/pages.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/widgets/widgets.dart';

class ProvinceListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProvinceListPageState();
}

class ProvinceListPageState extends State<ProvinceListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(Constants.appName),
        centerTitle: true,
      ),
      drawer: HomeDrawerWidget(),
      body: ListView.separated(
        itemBuilder: (context, index) {
          var p = 10.0;
          return FlatButton(
            child: Container(
              padding: index == 0
                  ? EdgeInsets.only(left: p, right: p, bottom: p, top: p * 2)
                  : index == Constants.provinceAbbreviations.length - 1
                      ? EdgeInsets.only(
                          left: p,
                          right: p,
                          bottom: p * 2,
                          top: p,
                        )
                      : EdgeInsets.all(p),
              child: Text(
                Constants.provinceAbbreviations.values.toList()[index],
                style: TextStyle(
                  color: Constants.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            onPressed: () {
              setState(() {
                var province =
                    Constants.provinceAbbreviations.keys.toList()[index];
                if (province == null) {
                  Navigator.pop(context);
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProvinceItemPage(
                        province: province,
                      ),
                    ),
                  );
                }
              });
            },
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Constants.primaryColor,
          );
        },
        itemCount: Constants.provinceAbbreviations.length,
      ),
    );
  }
}
