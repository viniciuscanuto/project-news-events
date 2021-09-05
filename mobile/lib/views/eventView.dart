import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EventView extends StatefulWidget {
  List events;

  EventView({this.events});

  @override
  _EventView createState() => _EventView();
}

class _EventView extends State<EventView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.events.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(
                widget.events[index].title,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              subtitle: Text(widget.events[index].local));
        });
  }
}
