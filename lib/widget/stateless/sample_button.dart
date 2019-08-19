import 'package:flutter/material.dart';
import 'package:flutter_login/config/asset_constants.dart';

class SampleButton extends StatelessWidget {
  var path = AssetConstants.orgAssetPath;
  var name = 'sample';

  SampleButton(this.path, this.name);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Padding(padding: EdgeInsets.only(bottom:13), child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  width: 55.0,
                  height: 55.0,
                  decoration: new BoxDecoration(
                    color: Color(0xFF333148),
                    borderRadius: new BorderRadius.circular(8.0),
                  ),
                  child: Column(children: <Widget>[
                    RaisedButton(onPressed: null, child: Image.asset(path), disabledColor: Color(0xFF333148))
                  ])),
              Text(
                name,
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ])));
  }
}
