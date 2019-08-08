import 'package:flutter/material.dart';
import 'package:flutter_login/config/route_constants.dart';
import 'package:flutter_login/handler/app_localizations.dart';
import 'package:flutter_login/widget/stateful/screens/login_screen.dart';
import 'package:flutter_login/widget/stateless/expense_image_asset.dart';
import 'package:flutter_login/widget/stateful/base/NotAuthenticatedScreenState.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WelcomeScreenState();
  }
}

class WelcomeScreenState extends NotAuthenticatedScreenState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/welcome_background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 60),
                child: ExpenseImageAsset(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(AppLocalizations.of(context).appName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700)),
              ),
              Expanded(
                child: Center(
                  child: Text(
                      'This app is designed for you. Journey will be your guide',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 12,
                          fontWeight: FontWeight.w600)),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(bottom: 20),
                  child: MaterialButton(
                      onPressed: () {},
                      child: Text('visitor login',
                          style: TextStyle(color: Colors.white)),
                      height: 40.0,
                      minWidth: 315.0,
                      color: new Color(0xff5e50e4),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)))),
              Text('already a member?',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white.withOpacity(0.6))),
              Container(
                  padding: EdgeInsets.only(bottom: 30, top: 10),
                  child: MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, RouteConstants.loginScreenRoute);
                      },
                      child: Text('login',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      height: 40.0,
                      minWidth: 315.0,
                      color: Colors.white,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))))
            ],
          ),
        ));
  }
}
