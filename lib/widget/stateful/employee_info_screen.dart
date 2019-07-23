import 'package:flutter/material.dart';
import 'search_box.dart';

class EmployeeInfoScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return EmployeeInfoScreenState();
  }
}

class EmployeeInfoScreenState extends State<EmployeeInfoScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
  body: Stack(
    children: <Widget>[
      SearchBox(),
    ],
  )
    );
  }
}