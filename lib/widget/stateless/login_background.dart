import 'package:flutter/material.dart';
import 'package:flutter_login/config/asset_constants.dart';

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetConstants.welcomeBackgroundAssetPath),
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}
