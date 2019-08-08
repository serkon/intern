import 'global_state_manager.dart';

abstract class CacheManager {
  static void cacheData(String key, Object data) async {
    GlobalStateManager globalStateManager = await GlobalStateManager.getInstance();
    await globalStateManager.setString(key, data);
  }

  static Future<bool> isCached(String key) async {
    return ((await fetchFromCache(key))?.isEmpty ?? true);
  }

  static Future<Map<String, dynamic>> fetchFromCache(String key) async {
    GlobalStateManager globalStateManager = await GlobalStateManager.getInstance();
    Map<String, dynamic> cachedData = await globalStateManager.getString(key);
    print("Returning from cache !");
    return cachedData;
  }
}