import 'package:flutter/material.dart';
import 'package:flutter_login/util/util.dart';
import 'package:flutter_login/widget/stateful/welcome_screen.dart';
import 'package:flutter_login/widget/stateless/give_message.dart';

abstract class AuthenticatedScreenState extends State {
  @override
  initState() {
    super.initState();
    Util.checkIfAuthenticated().then((isAuthed) {
      if (!isAuthed) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => new WelcomeScreen()),
              (Route<dynamic> route) => false,
        );
      }
    }).catchError((error) {
      giveMessage(context, "Error: " + error);
    });
  }
}
