import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_login/model/user.dart';
import 'package:flutter_login/util/encryption_provider.dart';
import 'package:flutter_login/util/util.dart';
import 'package:flutter_login/widget/stateful/employee_info_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_login/widget/stateful/welcome_screen.dart';

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

        debugPrint("Not authed !");
      }
    });
  }
}
