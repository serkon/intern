import 'dart:ui';

import 'package:flutter/material.dart';

import 'circled_image.dart';

class ExpenseImageAsset2 extends StatelessWidget {
  var roles = "sa";

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/journey_logo.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 0),
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                color: Colors.deepPurpleAccent.withOpacity(0.5),
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

                                disabledColor: Colors.white.withOpacity(0.15),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.only(top: 5.0),
                                        child: Icon(
                                          Icons.call,
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(top: 5.0),
                                        child: Text(
                                          "call",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                  ],
                                ))),
                        Padding(
                            padding: EdgeInsets.only(right: 10.0, bottom: 20),
                            child: RaisedButton(
                                disabledColor: Colors.white.withOpacity(0.15),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.only(top: 5.0),
                                        child: Icon(
                                          Icons.mail,
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(top: 5.0),
                                        child: Text(
                                          "e-mail",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                  ],
                                ))),
                        Padding(
                            padding: EdgeInsets.only(right: 10.0, bottom: 20),
                            child: RaisedButton(
                                disabledColor: Colors.white.withOpacity(0.15),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.only(top: 5.0),
                                        child: Icon(
                                          Icons.featured_video,
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(top: 5.0),
                                        child: Text(
                                          "see video",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                  ],
                                ))),
                      ])
                ]))));
  }
}
