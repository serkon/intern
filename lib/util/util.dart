import 'dart:convert';

import 'package:flutter_login/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'encryption_provider.dart';

class Util {
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

    if (currentUser == null || currentUser.accessToken?.isEmpty ?? true) {
      return false;
    }

    return true;
  }
}