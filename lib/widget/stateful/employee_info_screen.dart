import 'package:flutter/material.dart';
import 'package:flutter_login/widget/stateful/search_box2.dart';
import 'package:flutter_login/widget/stateless/login_background.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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
        key: scaffoldKey,
        appBar: AppBar(
            backgroundColor: Colors.deepPurpleAccent,
            leading: Builder(builder: (BuildContext context) {
              AssetImage assetImage = AssetImage('assets/images/org.png');
              Image image = Image(image: assetImage, width: 19.0, height: 17.0);
              return Container(child: image);
            }),
            title: SearchBox2(),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.menu),
              )
            ]),
        body: Container(
          color: Colors.deepPurple,
          height: 291.0,
          child: new ListView(children: [
          MaterialButton(

          )
          ]),
        ));
  }
}
