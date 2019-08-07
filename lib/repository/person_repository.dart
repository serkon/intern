import 'dart:convert';

import 'package:flutter_login/handler/global_state_manager.dart';
import 'package:flutter_login/model/person.dart';
import 'package:flutter_login/model/user.dart';
import 'package:flutter_login/service/person_service.dart';
import 'package:http/http.dart' as http;

abstract class PersonRepository {
  static Future<Person> getPersonByUserId() async {
    GlobalStateManager globalStateManager = await GlobalStateManager.getInstance();
    Map<String, dynamic> currentPersonCache = await globalStateManager.getString("currentPerson");
    if (currentPersonCache?.isEmpty ?? true) {
      http.Response response;
      response = await PersonService.getPersonByUserId();
      final parsedJson = await json.decode(response.body);
      Person person = Person.fromJson(parsedJson);
      await globalStateManager.setString("currentPerson", person);
      return person;
    }
    return Person.fromJson(currentPersonCache);
  }
}