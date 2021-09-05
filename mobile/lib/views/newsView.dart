import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewsView extends StatefulWidget {
  List news;

  NewsView({this.news});

  @override
  _NewsViewState createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.news.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(
                widget.news[index].title,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              subtitle: Text(widget.news[index].content));
        });
  }
}
