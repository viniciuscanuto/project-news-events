import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/config/api.dart';
import 'package:mobile/models/authenticationModel.dart';

class LoginView extends StatefulWidget {
  LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final emailControllerName = TextEditingController();
  final passwordControllerName = TextEditingController();

  var accessToken;

  login(context) async {
    final response = await http.post(Uri.parse(API.AUTHENTICATION),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'user': emailControllerName.value.text,
          'password': passwordControllerName.value.text
        }));
    if (response.statusCode == 200) {
      accessToken =
          AuthenticationModel.fromJson(json.decode(response.body)).accessToken;
      Navigator.pop(context, accessToken);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuário ou senha incorreto!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: this._formKey,
              child: ListView(
                children: <Widget>[
                  TextFormField(
                      // Use email input type for emails.
                      decoration: InputDecoration(
                          hintText: 'usuario', labelText: 'Usuário'),
                      controller: emailControllerName),
                  TextFormField(
                    obscureText: true, // Use secure text for passwords.
                    decoration:
                        InputDecoration(hintText: '*****', labelText: 'Senha'),
                    controller: passwordControllerName,
                  ),
                  Container(
                    child: ElevatedButton(
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () => this.login(context),
                    ),
                    margin: EdgeInsets.only(top: 20.0),
                  ),
                ],
              ),
            )));
  }
}
