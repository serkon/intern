import 'dart:io';
import 'package:flutter_login/config/service_constants.dart';
import 'package:flutter_login/model/user.dart';
import 'package:flutter_login/util/util.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'http_request_handler.dart';

class PersonService {
  static Future<http.Response> getPersonByUserId() async {
    HttpRequestHandler httpRequestHandler = await HttpRequestHandler.getInstance();
    http.Response response = await httpRequestHandler.get(
      ServiceConstants.getPersonByUserIdEndpoint + "?userId=" + httpRequestHandler.currentUser.userId,
    );
    return response;
  }
}
