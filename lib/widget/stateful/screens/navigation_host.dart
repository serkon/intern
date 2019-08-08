import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_login/widget/stateful/screens/phone_call.dart';
import 'email_menu.dart';
import 'package:flutter_login/widget/stateful/screens/employee_info_screen.dart';

class NavigationHost extends StatefulWidget {
  NavigationHost({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new NavigationHostState();
  }
}

class NavigationHostState extends State<NavigationHost> {
  int selectedIndex = 0;
  final widgetOptions = [
    new EmployeeInfoScreen(),
    new Email(),
    new PhoneCall(),
    new Email(),
    new PhoneCall(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: widgetOptions.elementAt(selectedIndex),
        ),
        bottomNavigationBar: SizedBox(
          height: 50,
          child: BottomNavigationBar(
            iconSize: 20,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.timeline), title: Text('Tab 1')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message), title: Text('Tab 2')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), title: Text('Tab 3')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.supervised_user_circle),
                  title: Text('Tab 4')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_view_day), title: Text('Tab 5')),
            ],
            currentIndex: selectedIndex,
            fixedColor: Colors.white,
            backgroundColor: Color(0xFF383a62),
            onTap: onItemTapped,
          ), //some widget )
        ));
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
