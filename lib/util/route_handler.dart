import 'package:flutter/material.dart';
import 'package:flutter_login/config/route_constants.dart';
import 'package:flutter_login/widget/stateful/email_menu.dart';
import 'package:flutter_login/widget/stateful/employee_info_screen.dart';
import 'package:flutter_login/widget/stateful/login_screen.dart';
import 'package:flutter_login/widget/stateful/phone_call.dart';
import 'package:flutter_login/widget/stateful/welcome_screen.dart';

class RouteHandler {
  static final Map<String, WidgetBuilder> routes = {
    RouteConstants.welcomeScreenRoute: (BuildContext context) => WelcomeScreen(),
    RouteConstants.loginScreenRoute: (BuildContext context) => LoginScreen(),
    RouteConstants.employeeInfoScreenRoute: (BuildContext context) => EmployeeInfoScreen(),
    RouteConstants.employeeInfoMailScreenRoute: (BuildContext context) => emailButton(),
    RouteConstants.employeeInfoPhoneScreenRoute: (BuildContext context) => PhoneCall(),
  };
}