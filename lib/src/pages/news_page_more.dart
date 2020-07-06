// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:developer';

import 'package:covid19cuba/src/models/news/news_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:covid19cuba/src/utils/utils.dart';

class NewsPageMore extends StatelessWidget {
  final NewsItem item;

  NewsPageMore(this.item);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Noticias'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              var subject = item.title;
              var text = """${item.title}

Fuente: ${item.source}
Autor: ${item.author}
Fecha: ${item.getUpdated().toStrPlus()}

${item.abstractStr}

Leer más: ${item.link}

Compartido por Covid19 Cuba Data (https://covid19cubadata.github.io)
""";
              Share.share(text, subject: subject);
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 10,
                        left: 10,
                        right: 10,
                        bottom: 5,
                      ),
                      child: Text(
                        item.title,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    onTap: () async {
                      if (await canLaunch(item.link)) {
                        await launch(item.link);
                      } else {
                        log('Could not launch $item.link');
                      }
                    },
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              'Fuente: ',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              item.source,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 11,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'Autor: ',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              item.author,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 11,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'Publicación: ',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              item.getPublished().toStrPlus(time: true),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 11,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'Actualización: ',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              item.getUpdated().toStrPlus(time: true),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 11,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Html(
                    data: item.summary,
                    padding: EdgeInsets.all(10),
                    linkStyle: TextStyle(
                      color: Colors.red,
                    ),
                    onLinkTap: (url) async {
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        log('Could not launch $url');
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
