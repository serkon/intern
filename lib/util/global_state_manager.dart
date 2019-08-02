import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'encryption_provider.dart';

class GlobalStateManager {
  static GlobalStateManager _instance;
  SharedPreferences _sharedPreferences;

  GlobalStateManager._(SharedPreferences sharedPreferences) {
    this._sharedPreferences = sharedPreferences;
  }

  static Future<GlobalStateManager> getInstance() async {
    if (_instance == null) {
      _instance = GlobalStateManager._(await SharedPreferences.getInstance());
    }
    return _instance;
  }

  static String encodeAndEncryptValue(dynamic value) {
    return EncryptionProvider.encrypt(json.encode(value));
  }

  Future<bool> setString(String key, dynamic value) {
    return _sharedPreferences.setString(key, encodeAndEncryptValue(value));
  }

  Future<Map<String, dynamic>> getString(String key) async {
    String encodedEncryptedString = _sharedPreferences.getString(key);
    return encodedEncryptedString == null ? null : await json.decode(EncryptionProvider.decrypt(encodedEncryptedString));
  }

  Future<bool> remove(String key) {
    return _sharedPreferences.remove(key);
  }
}