import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_login/widget/stateful/base/AuthenticatedScreenState.dart';
import 'package:flutter_login/widget/stateless/search_box.dart';

class EmployeeInfoScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return EmployeeInfoScreenState();
  }
}

class EmployeeInfoScreenState extends AuthenticatedScreenState {
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        SearchBox(),
      ],
    ));
  }
}
