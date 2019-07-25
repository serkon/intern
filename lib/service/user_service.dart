import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter_login/util/encryption_provider.dart';

class UserService {
  static final String _apiURL = 'http://journeymock.paastest.local:9003';
  static final String _apiVersion = '/v1';
  static final String _requestURL = _apiURL + _apiVersion;

  static Future<http.Response> loginUser(String username, String password) async{
    final String endpoint = '/login';
    final String encryptedPassword = EncryptionProvider.encrypt(password);
    final String encryptedUsername = EncryptionProvider.encrypt(username);
    final requestBody = jsonEncode({"password" : encryptedPassword, "userName" : encryptedUsername});
    final response = await http.post(_requestURL + endpoint,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: requestBody
    );

    return response;
  }
}
