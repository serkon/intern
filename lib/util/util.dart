import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_login/model/user.dart';
import 'package:flutter_login/service/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'encryption_provider.dart';

abstract class Util {
  Util._();

  static Future<bool> loginUser(String username, String password, BuildContext context) async {
    final response = await UserService.loginUser(username, password);

    if (response.statusCode == 200) {
      final parsedJson = await json.decode(response.body);
      User user;
      SharedPreferences globalStateManager;
      String encodedUser, encryptedUser;

      if (parsedJson['access_token'].toString()?.isEmpty ?? true) {
        return false;
      }

      user = User.fromJson(parsedJson);
      globalStateManager = await SharedPreferences.getInstance();
      encodedUser = json.encode(user);
      encryptedUser = EncryptionProvider.encrypt(encodedUser);
      await globalStateManager.setString("currentUser", encryptedUser);
      return true;
    }
    return false;
  }

  static Future checkIfAuthenticated() async {
    final globalStateManager = await SharedPreferences.getInstance();
    final String encodedEncryptedCurrentUser = globalStateManager.getString("currentUser");

    if (!(encodedEncryptedCurrentUser?.isEmpty ?? true)) {
      final String decryptedUser = EncryptionProvider.decrypt(encodedEncryptedCurrentUser);
      final Map<String, dynamic> decodedUser = await json.decode(decryptedUser);

      if (decodedUser != null) {
        final User currentUser = User.fromJson(decodedUser);
        return currentUser != null && (!(currentUser.accessToken?.isEmpty ?? true));
      }
    }
    return false;
  }
}