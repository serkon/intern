import 'dart:convert';
import 'dart:io';
import 'package:flutter_login/handler/error_handler.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter_login/util/encryption_provider.dart';

import 'package:flutter_login/config/service_constants.dart';

import 'http_request_handler.dart';

class AuthenticationService {
  // No cache
  static Future<http.Response> loginUser(String username, String password) async{
    final String encryptedPassword = EncryptionProvider.encrypt(password);
    final String encryptedUsername = EncryptionProvider.encrypt(username);
    final requestBody = jsonEncode({"password" : encryptedPassword, "userName" : encryptedUsername});
    final HttpRequestHandler httpRequestHandler = await HttpRequestHandler.getInstance();
    http.Response response = await httpRequestHandler.post(ServiceConstants.loginEndpoint,
        body: requestBody
    );
    return response;
  }

  // No cache
  static Future<http.Response> logoutUser() async{
    final HttpRequestHandler httpRequestHandler = await HttpRequestHandler.getInstance();
    http.Response response = await httpRequestHandler.post(ServiceConstants.logoutEndpoint);
    return response;
  }
}
