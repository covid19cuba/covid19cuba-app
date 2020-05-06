import 'package:flutter/material.dart';
import 'package:covid19cuba/src/utils/constants.dart';
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

    return SizedBox(
      height: 140,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 8,
            ),
            height: 130,
            width: width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0.1, 0.3),
                    blurRadius: 1,
                    //color: Constants.kShadowColor.withOpacity(0.5)
                  )
                ]),
          ),
          Container(
            width: width / 2.5,
            padding: EdgeInsets.all(10),
            child: imgPath.endsWith('.svg')
                ? SvgPicture.asset(imgPath, height: 90)
                : Image.asset(imgPath, height: 90),
          ),
          Positioned(
              left: 130,
              child: Container(
                padding: EdgeInsets.only(
                  left: 8,
                  right: 18.8,
                  top: 15,
                ),
                height: 136,
                width: width - 130,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        imgTitle,
                        style: Constants.kTitleTextstyle,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 8.0),
                        padding: const EdgeInsets.only(right: 2.0, bottom: 5),
                        child: Text(
                          desc,
                          maxLines: 5,
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                              fontSize: 14, height: 1.3, fontFamily: "Ubuntu"),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
