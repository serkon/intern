import 'package:flutter/material.dart';

import 'package:flutter_login/widget/stateless/welcome_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String name = '';
    return MaterialApp(
        title: "Expense Form",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: Scaffold(body: WelcomeScreen()));
  }
}
