import 'dart:io';
import 'package:flutter_login/config/service_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'http_request_handler.dart';

class PersonService {
  static Future<http.Response> getPersonByUserId(String userId, String tenantId, String accessToken) async{
  /*    final response = await HttpRequestHandler.get(ServiceConstants.getPersonByUserIdEndpoint + "?userId=$userId",
      "accessToken",
        headers: {
          "tenantId": tenantId,
        },
    ); */
    return null;
  }
}
