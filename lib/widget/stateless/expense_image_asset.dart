import 'package:flutter/material.dart';
import 'package:flutter_login/config/asset_constants.dart';

class ExpenseImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage =
    AssetImage(AssetConstants.logoAssetPath);
    Image image = Image(image: assetImage, width: 65.0, height: 65.0);
    return Container(child: image);
  }
}
