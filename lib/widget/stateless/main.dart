import 'package:flutter/material.dart';

import 'package:flutter_login/widget/stateful/my_home_page.dart';

import 'user_home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: <String, WidgetBuilder> {
        '/login': (BuildContext context) => MyHomePage(title: 'Login Page'),
        '/user_home' : (BuildContext context) => UserHome()
      },
    );
  }
}

