import 'package:flutter/material.dart';

class Message {
  static void giveMessage(BuildContext context, String msg) {
    var alertDialog = AlertDialog(
      title: Text("Message"),
      content: Text("$msg"),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}