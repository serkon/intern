import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:flutter_login/util/encryption_provider.dart';

class UserService {
  static final String _apiURL = 'http://ec2-34-244-31-212.eu-west-1.compute.amazonaws.com:9003';
  static final String _apiVersion = '/v1';
  static final String _requestURL = _apiURL + _apiVersion;

  static Future<http.Response> loginUser(String username, String password) async{
    final String endpoint = '/login';
    final String encryptedPassword = EncryptionProvider.encrypt(password).base64;
    final String encryptedUsername = EncryptionProvider.encrypt(username).base64;

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

