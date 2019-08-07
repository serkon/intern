import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login/config/app_constants.dart';
import 'package:flutter_login/config/error_constants.dart';
import 'package:flutter_login/model/person.dart';
import 'package:flutter_login/model/user.dart';
import 'package:flutter_login/service/authentication_service.dart';
import 'package:flutter_login/service/http_request_handler.dart';
import 'package:flutter_login/service/person_service.dart';
import '../main.dart';
import 'package:flutter_login/handler/app_localizations.dart';
import 'package:flutter_login/handler/global_state_manager.dart';
import 'package:http/http.dart' as http;

abstract class Util {
  Util._();

  static Future<void> initializeApp() async {
    await loadLocalizedValues();
    return true;
  }

  static Future<void> loadLocalizedValues() async {
    AppLocalizations.localizedValues = await getLocalizedValues();
    if (AppLocalizations.localizedValues == null) {
      throw ErrorConstants.localizationEmptyLocalizationValuesError;
    }
  }

  static Future<Map<String, dynamic>> getLocalizedValues() async {
    Map<String, dynamic> allLocalizations = new Map();
    for (Locale locale in AppConstants.supportedLocales) {
      String contents = await loadAsset(
          AppConstants.localizationAssetPath + locale.languageCode + ".json");
      Map<String, dynamic> currentLocalizations = await json.decode(contents);
      allLocalizations.addAll(currentLocalizations);
    }
    return allLocalizations;
  }

  static Future<String> loadAsset(String assetPath) async {
    return await rootBundle.loadString("assets/" + assetPath);
  }

  static Future<Person> getPersonByUserId() async {
    http.Response response;
    response = await PersonService.getPersonByUserId();
    final parsedJson = await json.decode(response.body);
    Person person = Person.fromJson(parsedJson);
    GlobalStateManager globalStateManager =
        await GlobalStateManager.getInstance();
    await globalStateManager.setString("currentPerson", person);
    return person;
  }

  static void updateLocale(
      String languageCode, String countryCode, BuildContext context) async {
    final GlobalStateManager globalStateManager =
        await GlobalStateManager.getInstance();
    globalStateManager.setString('languageCode', languageCode);
    globalStateManager.setString('countryCode', countryCode);
    MyApp.setLocale(context, Locale(languageCode, countryCode));
  }

  static Future<Locale> getLocale() async {
    final GlobalStateManager globalStateManager =
        await GlobalStateManager.getInstance();
    final Map<String, dynamic> languageCode =
        await globalStateManager.getString('languageCode');
    final Map<String, dynamic> countryCode =
        await globalStateManager.getString('countryCode');
    return languageCode == null
        ? null
        : Locale(languageCode["languageCode"], countryCode["countryCode"]);
  }

  static Future<void> loginUser(String username, String password) async {
    final response = await AuthenticationService.loginUser(username, password);
    final parsedJson = await json.decode(response.body);
    User user;
    GlobalStateManager globalStateManager;
    if (parsedJson['accessToken'].toString()?.isEmpty ?? true) {
      throw ErrorConstants.jsonFailedToParseAccessToken;
    }
    user = User.fromJson(parsedJson);
    globalStateManager = await GlobalStateManager.getInstance();
    await globalStateManager.setString("currentUser", user);
    HttpRequestHandler httpRequestHandler =
        await HttpRequestHandler.getInstance();
    httpRequestHandler.currentUser = user;
    return;
  }

  static Future<void> logoutUser() async {
    http.Response response;
    GlobalStateManager globalStateManager =
        await GlobalStateManager.getInstance();
    response = await AuthenticationService.logoutUser();
    if (json.decode(response.body)["succeed"] == true) {
      if (!(await globalStateManager.remove("currentUser"))) {
        throw (ErrorConstants.globalStateManagerFailedToRemoveCurrentUser);
      }
      HttpRequestHandler httpRequestHandler =
          await HttpRequestHandler.getInstance();
      httpRequestHandler.currentUser = null;
      return;
    }
  }

  static Future<bool> checkIfAuthenticated() async {
    final User currentUser = await getCurrentUser();
    return currentUser != null && (!(currentUser.accessToken?.isEmpty ?? true));
  }

  static Future<User> getCurrentUser() async {
    final GlobalStateManager globalStateManager =
        await GlobalStateManager.getInstance();
    final Map<String, dynamic> currentUserJSON =
        await globalStateManager.getString("currentUser");
    if (!(currentUserJSON?.isEmpty ?? true)) {
      return User.fromJson(currentUserJSON);
    }
    return null;
  }
}
