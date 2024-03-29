import 'package:flutter/material.dart';
import 'package:flutter_login/util/error_handler.dart';
import 'package:flutter_login/util/util.dart';
import 'package:flutter_login/widget/stateless/LbsText.dart';
import 'package:flutter_login/widget/stateless/expense_image_asset.dart';
import 'package:flutter_login/widget/stateless/give_message.dart';
import 'package:flutter_login/widget/stateless/login_background.dart';
import 'package:flutter_login/widget/stateful/base/NotAuthenticatedScreenState.dart';
import 'employee_info_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends NotAuthenticatedScreenState {
  String _usernameText, _passwordText;
  TextEditingController userNameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  void _doLogin() {
    _usernameText = userNameController.text.trim();
    _passwordText = passwordController.text.trim();
    if ((_usernameText?.isEmpty ?? true) || (_passwordText?.isEmpty ?? true)) {
      return Message.giveMessage(context, "Username and password cannot be empty !");
    }
    Util.loginUser(_usernameText, _passwordText).then((_) {
      Message.giveMessage(context, "Logged in !");
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => new EmployeeInfoScreen()),
        (Route<dynamic> route) => false,
      );
    }).catchError((error) {
      Message.giveMessage(context, ErrorHandler.handleError(error));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(children: <Widget>[
          Background(),
          Center(
              child: SingleChildScrollView(
                  child: Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 60, bottom: 10),
              child: ExpenseImageAsset(),
            ),
            Text('JOURNEY',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w700)),
            Padding(
              padding:
                  EdgeInsets.only(top: 170, left: 73, right: 72, bottom: 4),
              child: Text(
                  'Your username and password are sent to you via e-mail',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 12)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left:40, right:40),
              child: LbsText(
                  fontSize: 12,
                  title: "username",
                  color: Colors.white.withOpacity(0.8),
                  icon: Icons.person,
                  textCont: this.userNameController),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20, left:40, right:40),
              child: LbsText(
                  fontSize: 12,
                  title: "password",
                  color: Colors.white.withOpacity(0.8),
                  icon: Icons.lock,
                  password: true,
                  textCont: this.passwordController),
            ),
            Container(
                padding: EdgeInsets.only(bottom: 30, top: 10),
                child: MaterialButton(
                    onPressed: _doLogin,
                    child: Text('login', style: TextStyle(color: Color(0xFF363636), fontWeight: FontWeight.w900)),
                    height: 40.0,
                    minWidth: 315.0,
                    color: Colors.white,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0))))
          ])))
        ]));
  }
}
