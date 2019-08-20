import 'package:flutter/material.dart';
import 'package:flutter_login/config/route_constants.dart';
import 'package:flutter_login/widget/stateful/screens/email_menu.dart';
import 'package:flutter_login/widget/stateful/screens/employee_info_screen.dart';
import 'package:flutter_login/widget/stateful/screens/login_screen.dart';
import 'package:flutter_login/widget/stateful/screens/phone_call.dart';
import 'package:flutter_login/widget/stateful/screens/welcome_screen.dart';

class RouteHandler {
  static final Map<String, WidgetBuilder> routes = {
    RouteConstants.welcomeScreenRoute: (BuildContext context) => WelcomeScreen(),
    RouteConstants.loginScreenRoute: (BuildContext context) => LoginScreen(),
    RouteConstants.employeeInfoScreenRoute: (BuildContext context) => EmployeeInfoScreen(),
    RouteConstants.employeeInfoMailScreenRoute: (BuildContext context) => Email(),
    RouteConstants.employeeInfoPhoneScreenRoute: (BuildContext context) => PhoneCall(),
  };
}