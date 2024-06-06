import 'package:shared_preferences/shared_preferences.dart';

class CachHelper {
  static late SharedPreferences sharedPreferences;
  CachHelper._();
  /// initialize the [sharedPreferences] instance
  /// only once in the app lifecycle
  static initCache() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else {
      return await sharedPreferences.setDouble(key, value);
    }
  }

  /// update [data] with specific key in the cache
 static Future<dynamic> put({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else {
      return await sharedPreferences.setInt(key, value);
    }
  }

  /// get [String] data
 static Future<String?> getString({
    required String key,
  })async {
    return  sharedPreferences.getString(key);
  }

  /// get [bool] data
 static Future<bool?> getBool({
    required String key,
  })async {
    return sharedPreferences.getBool(key);
  }

  /// get [double] data
 static Future<double?> getDouble({
    required String key,
  })async {
    return sharedPreferences.getDouble(key);
  }

  /// get [int] data
 static Future<int?>getInt({
    required String key,
  })async {
    return  sharedPreferences.getInt(key);
  }

  /// remove [data] with specific key
 static Future<bool> remove({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  /// cleare all [data] from cache
 static Future<bool> clearData() async {
    return await sharedPreferences.clear();
  }

  /// checks if the [key] exists in the cache
 static Future<bool> containsKey({required String key}) async {
    return sharedPreferences.containsKey(key);
  }
}
