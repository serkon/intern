import 'dart:convert';
import 'package:flutter_login/config/service_constants.dart';
import 'package:flutter_login/model/person.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'http_request_handler.dart';

class PersonService {
  static Future<http.Response> _getPersonByUserId() async {
    HttpRequestHandler httpRequestHandler = await HttpRequestHandler.getInstance();
    http.Response response = await httpRequestHandler.get(
      ServiceConstants.getPersonByUserIdEndpoint + "?userId=" + httpRequestHandler.currentUser.userId,
    );
    return response;
  }

  static Future<Person> getPersonByUserId() async {
    http.Response response;
    response = await PersonService._getPersonByUserId();
    final parsedJson = await json.decode(response.body);
    print("Returning from service !");
    return Person.fromJson(parsedJson);
  }
}
