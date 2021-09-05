import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile/config/api.dart';
import 'package:mobile/models/newsModel.dart';
import 'package:mobile/views/newsView.dart';
import 'package:http/http.dart' as http;

class NewsController extends StatefulWidget {
  NewsController({Key key}) : super(key: key);

  @override
  _NewsControllerState createState() => _NewsControllerState();
}

class _NewsControllerState extends State<NewsController> {
  var news = [];

  index() {
    http.get(Uri.parse(API.NEWS)).then((response) {
      setState(() {
        Iterable lista = json.decode(response.body);
        news = lista.map((model) => NewsModel.fromJson(model)).toList();
      });
    });
  }

  _NewsControllerState() {
    index();
  }

  @override
  Widget build(BuildContext context) {
    return NewsView(news: news);
  }
}
