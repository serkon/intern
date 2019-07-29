import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login/config/app_constants.dart';
import 'package:flutter_login/model/user.dart';
import 'package:flutter_login/service/authentication_service.dart';
import 'package:flutter_login/service/person_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import 'app_localizations.dart';
import 'encryption_provider.dart';

abstract class Util {
  Util._();

  static Future<bool> initializeApp() async {
    AppLocalizations.localizedValues = await getLocalizedValues();
    if (AppLocalizations.localizedValues == null) {
      throw("Failed to read localized values !");
    }
    return true;
  }

  static Future<Map<String, dynamic>> getLocalizedValues() async {
    String contents = await loadAsset(AppConstants.localizationAssetPath);
    return await json.decode(contents);
  }

  static Future<String> loadAsset(String assetPath) async {
    return await rootBundle.loadString("assets/" + assetPath);
  }

  static Future<bool> getPersonByUserId() async {
    User currentUser = await getCurrentUser();
    final response = await PersonService.getPersonByUserId(currentUser.userId, currentUser.tenantList[0].tenantId, currentUser.accessToken);
    if (response.statusCode == 200) {
      // TODO:
    }
    throw("Response.statusCode is not 200 !");
  }

  static void updateLocale(String languageCode, String countryCode, BuildContext context) async {
    final SharedPreferences globalStateManager = await SharedPreferences.getInstance();
    globalStateManager.setString('languageCode', languageCode);
    globalStateManager.setString('countryCode', countryCode);
    MyApp.setLocale(context, Locale(languageCode, countryCode));
  }

  static Future<Locale> getLocale() async {
    final SharedPreferences globalStateManager = await SharedPreferences.getInstance();
    final String languageCode = globalStateManager.getString('languageCode');
    final String countryCode = globalStateManager.getString('countryCode');
    return languageCode == null ? null : Locale(languageCode, countryCode);
  }

  static Future<bool> loginUser(String username, String password) async {
    final response = await AuthenticationService.loginUser(username, password);
    if (response.statusCode == 200) {
      final parsedJson = await json.decode(response.body);
      User user;
      SharedPreferences globalStateManager;
      String encodedUser, encryptedUser;
      if (parsedJson['accessToken'].toString()?.isEmpty ?? true) {
        throw("Failed to parse accessToken !");
      }
      user = User.fromJson(parsedJson);
      globalStateManager = await SharedPreferences.getInstance();
      encodedUser = json.encode(user);
      encryptedUser = EncryptionProvider.encrypt(encodedUser);
      await globalStateManager.setString("currentUser", encryptedUser);
      return true;
    }
    throw("Response.statusCode is not 200 !");
  }

  static Future<bool> logoutUser() async {
    SharedPreferences globalStateManager = await SharedPreferences.getInstance();
    User currentUser = await getCurrentUser();
    final response = await AuthenticationService.logoutUser(currentUser.accessToken, currentUser.tenantList[1].tenantId);
    if (response.statusCode == 200 && json.decode(response.body)["succeed"] == true) {
      return (await globalStateManager.remove("currentUser") ? true : throw("Failed to remove currentUser from globalStateManager"));
    }
    throw("Failed to logout user !");
  }

  static Future<bool> checkIfAuthenticated() async {
    final User currentUser = await getCurrentUser();
    return currentUser != null && (!(currentUser.accessToken?.isEmpty ?? true));
  }

  static Future<User> getCurrentUser() async {
    final globalStateManager = await SharedPreferences.getInstance();
    final String encodedEncryptedCurrentUser = globalStateManager.getString("currentUser");
    if (!(encodedEncryptedCurrentUser?.isEmpty ?? true)) {
      final String decryptedUser = EncryptionProvider.decrypt(encodedEncryptedCurrentUser);
      final Map<String, dynamic> decodedUser = await json.decode(decryptedUser);
      if (decodedUser != null) {
        return User.fromJson(decodedUser);
      }
    }
    return null;
  }
}