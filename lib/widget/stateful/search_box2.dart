import 'package:flutter/material.dart';

class SearchBox2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 283.0,
      height: 28.0,
      child: TextFormField(
      decoration: InputDecoration(

          prefixIcon: Icon(Icons.search,
              size: 12.9, color: Colors.white.withOpacity(0.8)),
          border: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),

            ),
          ),
          filled: true,
          hintText: "Search",
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),

          fillColor: Colors.deepPurple),
    ));
  }
}
