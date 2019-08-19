import 'dart:io';

import 'package:flutter_login/config/error_constants.dart';
import 'package:flutter_login/model/user.dart';
import 'package:flutter_login/handler/error_handler.dart';
import 'package:flutter_login/util/util.dart';
import 'package:http/http.dart' as http;

class HttpRequestHandler {
  static HttpRequestHandler _instance;
  User currentUser;

  HttpRequestHandler._(User currentUser) {
    this.currentUser = currentUser;
  }

  static Future<HttpRequestHandler> getInstance() async {
    if (_instance == null) {
      _instance = HttpRequestHandler._(await Util.getCurrentUser());
    }
    return _instance;
  }

  Future<http.Response> get(String url, {Map<String, String> headers}) async {
    final response = await http.get(url,
      headers: generateHeaders(headers),
    );
    checkResponse(response);
    return response;
  }

  Future<http.Response> post(String url, {Map<String, String> headers, body}) async {
    final response = await http.post(url,
        headers: generateHeaders(headers),
        body: body
    );
    checkResponse(response);
    return response;
  }

  void checkResponse(http.Response response) {
    if (response.statusCode != 200) {
      throw ErrorConstants.serviceStatusCodeError;
    }
    else if (response.body?.isEmpty ?? true) {
      throw ErrorConstants.serviceEmptyResponseBodyError;
    }
  }

  Map<String, String> generateHeaders(Map<String, String> headers) {
    final Map<String, String> defaultHeaders = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    if (currentUser != null) {
      defaultHeaders["access_token"] = currentUser.accessToken;
      defaultHeaders["tenantId"] = currentUser.tenantList[0].tenantId;
    }
    if (headers != null) {
      defaultHeaders.addAll(headers);
    }
    return defaultHeaders;
  }
}
