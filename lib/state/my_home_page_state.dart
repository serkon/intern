import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_login/model/user.dart';
import 'package:flutter_login/service/user_service.dart';
import 'package:flutter_login/widget/stateful/my_home_page.dart';

import 'package:flutter/foundation.dart';

import '../encryption_provider.dart';

class MyHomePageState extends State<MyHomePage> {
  TextStyle _style = TextStyle(fontFamily: 'Monserrat', fontSize: 20.0);
  String _usernameText, _passwordText;
  bool _progressBarActive = false;

  Future _doLogin() async {
    if (_usernameText == null || _passwordText == null) {
      return;
    }

    setState(() {
      _progressBarActive = true;
    });

    final response = await UserService.loginUser(_usernameText, _passwordText);

    setState(() {
      _progressBarActive = false;
    });

    // TODO: not finished
    if (response.statusCode != 200) {
      return;
    }

    Navigator.of(context).pushReplacementNamed('/user_home');
  }

  @override
  Widget build(BuildContext context) {
    final usernameField = TextField(
      obscureText: false,
      style: _style,
      onChanged: (text) { _usernameText = text; },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Username",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passwordField = TextField(
      obscureText: true,
      style: _style,
      onChanged: (text) { _passwordText = text; },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: _doLogin,
        child: Text("Login",
            textAlign: TextAlign.center,
            style: _style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      body: Center(
        child: _progressBarActive == true ? const CircularProgressIndicator() : Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 45.0),
                usernameField,
                SizedBox(height: 25.0),
                passwordField,
                SizedBox(
                  height: 35.0,
                ),
                loginButton,
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
