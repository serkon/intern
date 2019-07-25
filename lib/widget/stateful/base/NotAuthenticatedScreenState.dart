import 'package:flutter/material.dart';
import 'package:flutter_login/util/util.dart';
import 'package:flutter_login/widget/stateful/employee_info_screen.dart';

abstract class NotAuthenticatedScreenState extends State {
  @override
  initState() {
    super.initState();

    Util.checkIfAuthenticated().then((isAuthed) {
      if (isAuthed) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => new EmployeeInfoScreen()),
              (Route<dynamic> route) => false,
        );
      }
    });
  }
}
