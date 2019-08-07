import 'package:flutter/material.dart';

import 'base/AuthenticatedScreenState.dart';


class Timeline extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TimelineState();
  }
}

class TimelineState extends AuthenticatedScreenState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
    );
  }
}