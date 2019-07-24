import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_login/model/user.dart';
import 'package:flutter_login/service/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'encryption_provider.dart';

class Util {
  static Future<bool> loginUser(String username, String password, BuildContext context) async {
    final response = await UserService.loginUser(username, password);

    if (response.statusCode != 200) {
      return false;
    }

    final parsedJson = await json.decode(response.body);

    if (parsedJson['access_token'].toString()?.isEmpty ?? true) {
      return false;
    }

    User user = User.fromJson(parsedJson);

    final globalStateManager = await SharedPreferences.getInstance();

    String encodedUser = json.encode(user);

    String encryptedUser = EncryptionProvider.encrypt(encodedUser);

    await globalStateManager.setString("currentUser", encryptedUser);

    return true;
  }

  static Future checkIfAuthenticated() async {
    final globalStateManager = await SharedPreferences.getInstance();

    String encodedEncryptedCurrentUser =
    globalStateManager.getString("currentUser");

    if (encodedEncryptedCurrentUser?.isEmpty ?? true) {
      return false;
    }

    String decryptedUser =
    EncryptionProvider.decrypt(encodedEncryptedCurrentUser);

    Map<String, dynamic> decodedUser = await json.decode(decryptedUser);

    if (decodedUser == null) {
      return false;
    }

    User currentUser = User.fromJson(decodedUser);
    
    if (currentUser == null || (currentUser.accessToken?.isEmpty ?? true)) {
      return false;
    }

    return true;
  }
}