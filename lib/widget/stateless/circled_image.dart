import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  var url =
      "https://i.dailymail.co.uk/i/pix/2015/09/01/18/2BE1E88B00000578-3218613-image-m-5_1441127035222.jpg";
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
