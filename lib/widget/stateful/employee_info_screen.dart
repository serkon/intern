import 'package:flutter/material.dart';
import 'package:flutter_login/widget/stateful/base/AuthenticatedScreenState.dart';
import 'package:flutter_login/widget/stateless/search_box.dart';
import 'package:flutter_login/widget/stateful/search_box.dart';
import 'package:flutter_login/widget/stateless/blur_img.dart';
import 'package:flutter_login/widget/stateless/login_background.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class EmployeeInfoScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EmployeeInfoScreenState();
  }
}

class EmployeeInfoScreenState extends AuthenticatedScreenState {
  Widget build(BuildContext context) {
    var assetImage = new AssetImage("assets/images/sunglasses-c.png");
    var image = new Image(image: assetImage, height: 50.0, width: 330.0);
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
            backgroundColor: Colors.deepPurpleAccent,
            leading: Builder(builder: (BuildContext context) {
              AssetImage assetImage = AssetImage('assets/images/org.png');
              Image image = Image(image: assetImage, width: 19.0, height: 17.0);
              return Container(child: image);
            }),
            title: SearchBox(),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.menu),
              )
            ]),
        body: Stack(
          children: <Widget>[
            Positioned.fill(
                child: Container(
                    color: Colors.deepPurple,
                    child: ListView(
                      children: <Widget>[
                        ExpenseImageAsset2(),
                      ],
                    )))
          ],
        ));
  }
}
