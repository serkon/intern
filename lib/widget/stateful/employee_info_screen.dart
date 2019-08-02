import 'package:flutter/material.dart';
import 'package:flutter_login/util/error_handler.dart';
import 'package:flutter_login/util/util.dart';
import 'package:flutter_login/widget/stateful/base/AuthenticatedScreenState.dart';
import 'package:flutter_login/widget/stateless/sample_button.dart';
import 'package:flutter_login/widget/stateless/search_box2.dart';
import 'package:flutter_login/widget/stateful/welcome_screen.dart';
import 'package:flutter_login/widget/stateless/give_message.dart';

import 'package:flutter_login/widget/stateless/search_box.dart';
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
  void _doLogout() {
    Util.logoutUser().then((_) {
      Message.giveMessage(context, "Logout successful !");
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => new WelcomeScreen()),
            (Route<dynamic> route) => false,
      );
    }).catchError((error) {
      Message.giveMessage(context, ErrorHandler.handleError(error));
    });
  }

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
                onPressed: _doLogout,
                icon: const Icon(Icons.menu),
              )
            ]),
        body: Stack(
          children: <Widget>[
            Positioned.fill(
                child: Container(
                    color: Color(0xFF1c1a34),
                    child: ListView(
                      children: <Widget>[
                        ExpenseImageAsset2(),
                        Container(
                          child: Row(children: [
                            Padding(
                                padding: EdgeInsets.only(left: 20, top: 71),
                                child: Column(children: [
                                  SampleButton(
                                      'assets/custom_icons/posts.png', 'posts'),
                                  SampleButton(
                                      'assets/custom_icons/challenges.png',
                                      'challenges'),
                                  SampleButton(
                                      'assets/custom_icons/social-groups.png',
                                      'social groups'),
                                  SampleButton(
                                      'assets/custom_icons/treasure.png',
                                      'payments'),
                                  SampleButton('assets/custom_icons/posts.png',
                                      'surveys'),
                                ])),
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text("5 MAIN OBJECTIVES",
                                    style: TextStyle(color: Colors.white)),

                              ],
                            )),
                            Padding(
                                padding: EdgeInsets.only(right: 20, top: 71),
                                child: Column(children: [
                                  SampleButton(
                                      'assets/custom_icons/beer.png', 'events'),
                                  SampleButton(
                                      'assets/custom_icons/education.png',
                                      'education'),
                                  SampleButton(
                                      'assets/custom_icons/resources.png',
                                      'resources'),
                                  SampleButton(
                                      'assets/custom_icons/teams.png', 'teams'),
                                  SampleButton('assets/custom_icons/teams.png',
                                      'mentorship'),
                                ])),
                          ]),
                        ),
                      ],
                    )))
          ],
        ));
  }
}
