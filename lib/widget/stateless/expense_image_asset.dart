import 'package:flutter/material.dart';

class ExpenseImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage =
    AssetImage('assets/images/journey_logo.png');
    Image image = Image(image: assetImage, width: 65.0, height: 65.0);
    return Container(child: image);
  }
}
