import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile/config/api.dart';
import 'package:mobile/controllers/AuthenticationController.dart';
import 'package:mobile/models/eventModel.dart';
import 'package:mobile/views/eventView.dart';
import 'package:mobile/views/loginView.dart';
import 'package:http/http.dart' as http;

class EventController extends StatefulWidget {
  const EventController({Key key}) : super(key: key);

  @override
  _EventControllerState createState() => _EventControllerState();
}

class _EventControllerState extends State<EventController> {
  var events = [];
  String accessToken;
  var isLogged = false;

  index() {
    print('opa $accessToken');
    http.get(Uri.parse(API.EVENTS), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'x-access-token': accessToken
    }).then((response) {
      print(json.decode(response.body));
      setState(() {
        Iterable lista = json.decode(response.body);
        events = lista.map((model) => EventModel.fromJson(model)).toList();
      });
    });
  }

  _EventControllerState() {
    if (isLogged) {
      index();
    }
  }

  @override
  Widget build(BuildContext context) {
    teste() async {
      var result = await Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return LoginView();
      }));
      print(result);

      setState(() {
        accessToken = result;
        isLogged = true;
      });

      index();
    }

    return (isLogged)
        ? EventView(events: events)
        : AlertDialog(
            title: const Text('Atenção'),
            content:
                const Text('É necessário realizar o login para continuar!'),
            actions: <Widget>[
              TextButton(
                onPressed: () => teste(),
                child: const Text('Fazer Login'),
              ),
            ],
          );
  }
}
