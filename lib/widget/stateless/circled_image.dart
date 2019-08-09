import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  var url =
      "https://i.elmaelma.com/2/750/430/storage/files/images/2019/08/04/beren-saatin-kurban-bayrami-paylasi-0JqH_cover.jpg";
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
