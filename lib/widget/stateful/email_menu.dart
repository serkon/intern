import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'custom_list_item.dart';

class emailButton extends StatelessWidget {
  final List<String> entries = <String>['Old', 'France', 'France'];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xFF1c1a34),
      appBar: AppBar(
        title: Text(
          "E-mail Adresses",
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF1c1a34),
      ),
      body: Container(
        child: ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: entries.length + 1,
          //itemExtent: 92,
          itemBuilder: (BuildContext context, int index) {
            return CustomListItem(entries, index);
          },
        ),
      ),
    );
  }
}
