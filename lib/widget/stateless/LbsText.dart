import 'package:flutter/material.dart';

class LbsText extends StatelessWidget {
  final String title;
  final String description;
  final Color color;
  final double fontSize;
  final IconData icon;
  final bool password;

  LbsText(
      {Key key,
        this.title = "Enter Your Input Title",
        this.description,
        this.color = Colors.white,
        this.fontSize = 12,
        this.icon = Icons.remove_red_eye,
        this.password = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      // cursorColor: Colors.red,
      // cursorRadius: Radius.circular(1),
      // cursorWidth: 16.0,
      textAlign: TextAlign.start,
      obscureText: this.password,
      decoration: InputDecoration(
        // prefix: Icon(
        //   this.icon,
        //   size: 20,
        //   color: this.color.withOpacity(0.8),
        // ),
        prefixIcon: Icon(this.icon,
            size: this.fontSize, color: this.color.withOpacity(0.8)),
        //suffixIcon: FlatButton(
        // onPressed: () => print("yunus tÄ±kladÄ±"),
        //child: Icon(Icons.remove_red_eye),
        //),
        enabledBorder: UnderlineInputBorder(
          borderSide:
          BorderSide(color: this.color.withOpacity(0.5), width: 0.5),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide:
          BorderSide(color: this.color.withOpacity(0.5), width: 0.5),
        ),
        labelText: this.title,
        labelStyle: TextStyle(color: this.color, fontSize: this.fontSize),
        // hintText: this.title,
        // hintStyle: TextStyle(color: this.color),
        helperText: this.description,
        helperStyle: TextStyle(color: this.color.withOpacity(0.8)),
      ),
      style: TextStyle(
          color: this.color,
          fontWeight: FontWeight.w300,
          fontSize: this.fontSize),
    );
  }
}
