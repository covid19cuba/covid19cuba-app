// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SmallCard extends StatelessWidget {
  final String imgPath;
  final String imgTitle;
  final String desc;

  const SmallCard({Key key, this.imgPath, this.imgTitle, this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: Card(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: <Widget>[
              Container(
                width: width / 2.5,
                padding: EdgeInsets.all(10),
                child: imgPath.endsWith('.svg')
                    ? SvgPicture.asset(imgPath, height: 90)
                    : Image.asset(imgPath, height: 90),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 10, top: 10, bottom: 5),
                      child: Text(
                        imgTitle,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10, top: 5, bottom: 10),
                      child: Text(desc),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
