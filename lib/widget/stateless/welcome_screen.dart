import 'package:flutter/material.dart';
import 'package:flutter_login/widget/stateful/login_screen.dart';
import 'package:flutter_login/widget/stateless/expense_image_asset.dart';
//import 'lbsText.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        resizeToAvoidBottomInset: true,
        body: Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
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
              Text('JOURNEY',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700)),
              Expanded(
                child: Center(
                  child: Text(
                      'This app is designed for you. Journey will be your guide',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white,
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
                  style: TextStyle(color: Colors.white)),
              Container(
                  padding: EdgeInsets.only(bottom: 30, top: 10),
                  child: MaterialButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return LoginScreen();
                            }));
                      },
                      child: Text('login',
                          style: TextStyle(color: Colors.black)),
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
