import 'package:flutter/material.dart';
import 'package:flutter_login/widget/stateful/phone_menu.dart';

class PhoneCall extends StatelessWidget {
  final List<String> entries = <String>[
    'Old',
    'France',
    'Mobile',
    'Deneme',
    'yeni',
    'ev',
    'sirket',
    'calisan',
    'yeni',
    'Cep'
  ];

  @override
  Widget build(BuildContext context) {
    var heightt = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xFF1c1a34),
      appBar: AppBar(
        title: Text(
          "Phone Numbers",
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF1c1a34),
      ),
      body: Container(
        child: ListView.builder(
          padding: const EdgeInsets.all(7.0),
          itemCount: entries.length + 1,
          //itemExtent: 70,
          itemBuilder: (BuildContext context, int index) {
            return CustomListItemPhone(entries, index);
          },
        ),
      ),
    );
  }
}
