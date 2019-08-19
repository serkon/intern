import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_login/widget/stateful/screens/email_menu.dart';
import 'package:flutter_login/widget/stateful/screens/phone_call.dart';

import '../../config/route_constants.dart';
import 'circled_image.dart';

class ExpenseImageAsset2 extends StatelessWidget {
  var roles = "roles";

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/employee_profil.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 0),
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                color: Color(0xFF463D63).withOpacity(0.61),
                child: Column(children: <Widget>[
                  Expanded(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                        RaisedButton(
                            disabledColor: Colors.white.withOpacity(0.0),
                            onPressed: null,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(top: 15.0),
                                    child: Icon(
                                      Icons.bookmark,
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      roles,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                              ],
                            )),
                        CircleImage(),
                        RaisedButton(
                            disabledColor: Colors.white.withOpacity(0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(top: 15.0),
                                    child: Icon(
                                      Icons.account_circle,
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(top: 15.0),
                                    child: Text(
                                      "about",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                              ],
                            ))
                      ])),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 10.0, bottom: 20),
                            child: RaisedButton(
                                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(4.0)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                          new PhoneCall()));
                                },
                                color: Colors.white.withOpacity(0.15),
                                disabledColor: Colors.white.withOpacity(0.15),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.only(top: 5.0),
                                        child: Icon(
                                          Icons.call,
                                          color: Colors.white.withOpacity(0.6),
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                                        child: Text(
                                          "call",
                                          style: TextStyle(
                                            color: Colors.white.withOpacity(0.65),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        )),
                                  ],
                                ))),
                        Padding(
                            padding: EdgeInsets.only(right: 10.0, bottom: 20),
                            child: RaisedButton(
                                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(4.0)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                          new Email()));                                },
                                color: Colors.white.withOpacity(0.15),
                                disabledColor: Colors.white.withOpacity(0.15),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.only(top: 5.0),
                                        child: Icon(
                                          Icons.mail,
                                          color: Colors.white.withOpacity(0.6),
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                                        child: Text(
                                          "e-mail",
                                          style: TextStyle(
                                            color: Colors.white.withOpacity(0.65),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        )),
                                  ],
                                ))),
                        Padding(
                            padding: EdgeInsets.only(right: 10.0, bottom: 20),
                            child: RaisedButton(
                                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(4.0)),
                                disabledColor: Colors.white.withOpacity(0.15),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.only(top: 5.0),
                                        child: Icon(
                                          Icons.featured_video,
                                          color: Colors.white.withOpacity(0.6),
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                                        child: Text(
                                          "see video",
                                          style: TextStyle(
                                            color: Colors.white.withOpacity(0.65),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        )),
                                  ],
                                ))),
                      ])
                ]))));
  }
}
