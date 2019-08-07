import 'package:flutter/material.dart';

//how to select male or female according to the current user????
class CharacterImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage =
    AssetImage('assets/images/female1.png');
    Image image = Image(image: assetImage, width: 60.0, height: 134.0);
    return Container(child: image);
  }
}
