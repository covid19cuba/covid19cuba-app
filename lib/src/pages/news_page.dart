import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:covid19cuba/src/blocs/blocs.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/utils/constants.dart';
import 'package:covid19cuba/src/widgets/widgets.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Container(
        child: Center(
          child: Text(
            'En construcción',
            style: TextStyle(fontSize: 22),
          ),
        ),
      ),
    );
  }
}
