import 'package:flutter/material.dart';
import 'package:flutter_login/handler/error_handler.dart';
import 'package:flutter_login/repository/person_repository.dart';
import 'package:flutter_login/util/util.dart';
import 'package:flutter_login/widget/stateful/base/AuthenticatedScreenState.dart';
import 'package:flutter_login/widget/stateless/character_image.dart';
import 'package:flutter_login/widget/stateless/progress_bar.dart';
import 'package:flutter_login/widget/stateless/sample_button.dart';
import 'package:flutter_login/widget/stateful/screens/welcome_screen.dart';
import 'package:flutter_login/widget/stateless/give_message.dart';

import 'package:flutter_login/widget/stateless/search_box.dart';
import 'package:flutter_login/widget/stateless/blur_img.dart';


final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class EmployeeInfoScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EmployeeInfoScreenState();
  }
}

class EmployeeInfoScreenState extends AuthenticatedScreenState {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PersonRepository.getPersonByUserId().then((person) {
      print("Person code: " + person.personCode);
    }).catchError((error) {
      Message.giveMessage(context, ErrorHandler.handleError(error));
    });
  }

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
    return MaterialApp(
        home: DefaultTabController(
        length: 1,
        child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
            backgroundColor: Color(0xFF1c1a34),
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
        body:      Stack(
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text("5 MAIN OBJECTIVES",
                                        style: TextStyle(color: Colors.white)),
                                    Center(
                                        child: Column(
                                            children: [
                                              CharacterImage(),
                                              ProgressBar(5, AlwaysStoppedAnimation<Color>(Color(0xFF01cc78)), 'OPENNESS'),
                                              ProgressBar(3, AlwaysStoppedAnimation<Color>(Color(0xFF5e50e4)), 'CONSCIENTIOUSNESS'),
                                              ProgressBar(3, AlwaysStoppedAnimation<Color>(Color(0xFFfe2851)), 'EXTROVERSION'),
                                              ProgressBar(8, AlwaysStoppedAnimation<Color>(Color(0xFFffcd00)), 'AGREEABLENESS'),
                                              ProgressBar(4, AlwaysStoppedAnimation<Color>(Color(0xFF0076ff)), 'NEUROTICISM'),

                                            ])) ],
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
                                ])),]),
                        ),
                      ],
                    ))),

          ],
        ),

    )));
  }
}
