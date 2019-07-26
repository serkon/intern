import 'dart:io';
import 'package:flutter_login/service/service_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class PersonService {
  static Future<http.Response> getPersonByUserId(String userId, String tenantId, String accessToken) async{
    final response = await http.get(ServiceConstants.getPersonByUserIdEndpoint + "?userId=$userId",
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          "tenantId": tenantId,
          "access_token": accessToken
        },
    );
    return response;
  }
}
