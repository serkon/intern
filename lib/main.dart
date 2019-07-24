import 'package:flutter/material.dart';

import 'package:flutter_login/widget/stateful/welcome_screen.dart';

import 'widget/stateful/employee_info_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Expense Form",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: Scaffold(body: WelcomeScreen()));
  }
}
