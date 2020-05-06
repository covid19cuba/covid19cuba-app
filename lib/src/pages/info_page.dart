import 'package:covid19cuba/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:covid19cuba/src/utils/constants.dart';
import 'package:covid19cuba/src/pages/pages.dart';
import 'package:covid19cuba/src/widgets/info_header.dart';
import 'package:covid19cuba/src/blocs/blocs.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      //backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        //backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(Constants.appName),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            color: Colors.white,
            onPressed: () {
              BlocProvider.of<HomeBloc>(context).add(FetchHomeEvent());
            },
          ),
        ],
      ),
      drawer: HomeDrawerWidget(),
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InfoHeader(
              image: "assets/images/doctor.svg",
              textTop: "Conozca acerca",
              textBottom: "de la Covid-19",
              offset: offset,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      left: 5,
                    ),
                    child: Text(
                      "Síntomas principales",
                      style: Constants.kTitleTextstyle,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 5),
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    smallCardContainer("assets/images/dolor_cabeza.svg",
                        "Dolor de cabeza", context),
                    SizedBox(
                      width: 5,
                    ),
                    smallCardContainer("assets/images/dolor_garganta.svg",
                        "Dolor de garganta", context),
                    SizedBox(
                      width: 5,
                    ),
                    smallCardContainer("assets/images/tos.svg", "Tos", context),
                    SizedBox(
                      width: 5,
                    ),
                    smallCardContainer(
                        "assets/images/fiebre.svg", "Fiebre", context),
                    SizedBox(
                      width: 5,
                    ),
                    smallCardContainer("assets/images/falta_aire.svg",
                        "Dificultad para respirar", context),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              padding: EdgeInsets.all(16),
              width: width,
              height: 130,
              decoration: BoxDecoration(
                  // image: DecorationImage(
                  //   image: AssetImage("assets/images/casa.png"),
                  //   alignment: Alignment.centerRight,
                  //   fit: BoxFit.contain,
                  // ),
                  borderRadius: BorderRadius.circular(10),
                  color: Constants.primaryColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                          "No salga de casa\nAsí detendremos a la Covid-19       ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          )),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => InfoMorePage()));
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.purple),
                          child: Text(
                            "Saber más",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      )
                    ],
                  ),
                  Flexible(
                    child: Image.asset("assets/images/casa.png",
                        width: width * 0.4, fit: BoxFit.cover),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      left: 5,
                    ),
                    child: Text(
                      "Prevención",
                      style: Constants.kTitleTextstyle,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 5),
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    smallCardContainer("assets/images/clean_hands.svg",
                        "Lave sus manos", context),
                    SizedBox(
                      width: 5,
                    ),
                    smallCardContainer("assets/images/man_mask.svg",
                        "Use mascarilla", context),
                    SizedBox(
                      width: 5,
                    ),
                    smallCardContainer("assets/images/dont_face_touch.svg",
                        "No se toque la cara", context),
                    SizedBox(
                      width: 5,
                    ),
                    smallCardContainer("assets/images/distance_keep_social.png",
                        "Distancia social", context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget smallCardContainer(String imgPath, String imgTitle, context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
        width: width * 0.3,
        height: 160,
        margin: EdgeInsets.only(left: 5, bottom: 8),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 0.1),
                blurRadius: 0.1,
              )
            ]),
        child: Column(
          children: <Widget>[
            Center(
                child: imgPath.endsWith('.svg')
                    ? SvgPicture.asset(imgPath, height: 90)
                    : Image.asset(imgPath, height: 90)),
            SizedBox(
              height: 5,
            ),
            Text(
              imgTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: "Ubuntu",
                fontSize: 15,
              ),
            )
          ],
        ));
  }
}
