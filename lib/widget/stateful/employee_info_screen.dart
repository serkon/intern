import 'package:flutter/material.dart';
import 'package:flutter_login/util/util.dart';
import 'package:flutter_login/widget/stateful/base/AuthenticatedScreenState.dart';
import 'package:flutter_login/widget/stateless/search_box2.dart';
import 'package:flutter_login/widget/stateful/welcome_screen.dart';
import 'package:flutter_login/widget/stateless/give_message.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class EmployeeInfoScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EmployeeInfoScreenState();
  }
}

class EmployeeInfoScreenState extends AuthenticatedScreenState {
  void _doLogout() {
    Util.logoutUser().then((success) {
      giveMessage(context, "Logout successful !");
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => new WelcomeScreen()),
            (Route<dynamic> route) => false,
      );
    }).catchError((error) {
      giveMessage(context, "Logout failed due: " + error.toString());
    });
  }

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
                onPressed: _doLogout,
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
