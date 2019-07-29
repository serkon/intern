import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter_login/util/encryption_provider.dart';

import 'package:flutter_login/config/service_constants.dart';

class AuthenticationService {
  static Future<http.Response> loginUser(String username, String password) async{
    final String encryptedPassword = EncryptionProvider.encrypt(password);
    final String encryptedUsername = EncryptionProvider.encrypt(username);
    final requestBody = jsonEncode({"password" : encryptedPassword, "userName" : encryptedUsername});
    final response = await http.post(ServiceConstants.loginEndpoint,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: requestBody
    );
    return response;
  }

  static Future<http.Response> logoutUser(String accessToken, String tenantId) async{
    final response = await http.post(ServiceConstants.logoutEndpoint,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          "tenantId" : tenantId,
          "access_token" : accessToken
        },
    );
    return response;
  }
}
