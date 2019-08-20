import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  var value = 10;
  var fillColor = AlwaysStoppedAnimation<Color>(Color(0xFF01cc78));
  var progressName = 'sample progress bar';

  ProgressBar(this.value, this.fillColor, this.progressName);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(bottom: 10),
        child: Column(children: [
          Text(
            progressName,
            style:
                TextStyle(color: Colors.white.withOpacity(0.65), fontSize: 10),
          ),
          Center(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
            Text(
              "$value 0 %",
              style:
                  TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 10),
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Container(
                    width: 132.0,
                    height: 8.0,
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.white.withOpacity(0.15),
                      valueColor: fillColor,
                      value: value * 0.1,
                    )))
          ]))
        ]));
  }
}
