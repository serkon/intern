import 'package:flutter/material.dart';
import 'package:flutter_login/config/asset_constants.dart';

class CharacterImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage =
    AssetImage(AssetConstants.female1AssetPath);
    Image image = Image(image: assetImage, width: 60.0, height: 134.0);
    return Container(child: image);
  }
}
