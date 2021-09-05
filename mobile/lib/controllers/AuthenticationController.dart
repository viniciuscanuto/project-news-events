import 'package:flutter/material.dart';
import 'package:mobile/views/loginView.dart';

class AuthenticationController extends StatefulWidget {
  const AuthenticationController({Key key}) : super(key: key);

  @override
  _AuthenticationControllerState createState() =>
      _AuthenticationControllerState();
}

class _AuthenticationControllerState extends State<AuthenticationController> {
  @override
  Widget build(BuildContext context) {
    return new LoginView();
  }
}
