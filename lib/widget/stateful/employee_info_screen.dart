import 'package:flutter/material.dart';

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
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.teal.withOpacity(0.5),
      ),
    );
  }
}