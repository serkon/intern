import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_login/widget/stateful/welcome_screen.dart';
import 'util/app_localizations.dart';
import 'util/util.dart';

void main() {
  Util.initializeApp().then((success) {
    if (!success) {
      throw ("Failed to initialize the app !");
    }
    runApp(MyApp());
  }).catchError((error) {
    print(error);
  });
}

class MyApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale newLocale) async {
    MyAppState state = context.ancestorStateOfType(TypeMatcher<MyAppState>());
    state.setState(() {
      state.locale = newLocale;
    });
  }

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  Locale locale;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: [
          AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', ''), // English
          const Locale('tr', ''), // Turkish
        ],
        locale: locale,
        title: "Expense Form",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: Scaffold(body: WelcomeScreen()));
  }
}
