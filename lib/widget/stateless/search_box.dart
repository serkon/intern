import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Search"), actions: <Widget>[
      IconButton(icon: Icon(Icons.search, size:283,), onPressed: () {
        showSearch(context: context, delegate: DataSearch());
      })
    ]));
  }
}

class DataSearch extends SearchDelegate<String> {
  final users = ["Yunus Emre Meydancı", "Ertan Ayanlar", "Nursena Köprücü", "Büşra Uyar"];

  final recentUsers = ["Nursena Köprücü", "Büşra Uyar"];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () {})];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // left side
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {});
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ? recentUsers : users;
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.account_circle),
        title: Text(suggestionList[index]),
      ),
      itemCount: suggestionList.length,
    );
  }
}
