import 'package:flutter_login/handler/cache_manager.dart';
import 'package:flutter_login/model/person.dart';
import 'package:flutter_login/service/person_service.dart';

abstract class PersonRepository {
  static Future<Person> getPersonByUserId() async {
    final String cacheKey = "currentPerson";
    final Map<String, dynamic> cachedPersonJSON = await CacheManager.fetchFromCache(cacheKey);
    if (cachedPersonJSON?.isEmpty ?? true) {
      return await cachePersonFromService(cacheKey);
    }
    return Person.fromJson(cachedPersonJSON);
  }

  static Future<Person> cachePersonFromService(String cacheKey) async {
    Person person = await PersonService.getPersonByUserId();
    CacheManager.cacheData(cacheKey, person);
    return person;
  }
}