import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_login/config/asset_constants.dart';
import 'package:flutter_login/model/person.dart';

class CircleImage extends StatelessWidget {
  var url = AssetConstants.defaultProfilePictureURL;
  var name = "Sample Profile";
  var tittle = "Developer";
  Person person = new Person();
  String base64 = "data:image/jpeg;base64,";
  UriData data;

  CircleImage(Person user) {
    if (user != null) {
      this.person = user;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Container(
            padding: EdgeInsets.only(left: 42, right: 31),
            width: 90.0,
            height: 90.0,
            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    fit: BoxFit.cover,
                    image: new MemoryImage(
                        base64Decode(this.person.personImage))))),
        new Text(
          this.person.name + " " + this.person.surname,
          style: TextStyle(color: Colors.white),
        ),
        new Text(
          this.person.title,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
