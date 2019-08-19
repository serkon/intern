import 'package:flutter/material.dart';
import 'package:flutter_login/config/asset_constants.dart';

class CircleImage extends StatelessWidget {
  var url = AssetConstants.defaultProfilePictureURL;
  var name = "Sample Profile";
  var tittle = "Developer";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Container(
          padding: EdgeInsets.only(left:42, right:31),
            width: 90.0,
            height: 90.0,
            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    fit: BoxFit.cover, image: new NetworkImage(url)))),
        new Text(name, style: TextStyle(color: Colors.white),),
        new Text(tittle, style: TextStyle(color: Colors.white),),


      ],
    );
  }
}
