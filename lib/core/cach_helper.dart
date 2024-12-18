import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  CacheHelper._internal();

  static final CacheHelper _instance = CacheHelper._internal();

  factory CacheHelper() => _instance;

  static SharedPreferences? preferences;

  static Future<void> initShardPreferences() async {
    preferences = await SharedPreferences.getInstance();
  }

  static String? getString(String key) {
    return preferences?.getString(key);
  }

  static bool? getBool(String key) {
    return preferences?.getBool(key);
  }

  static double? getDouble(String key) {
    return preferences?.getDouble(key);
  }

  static int? getInteger(String key) {
    return preferences?.getInt(key);
  }

  static saveData(String key, dynamic value) async {
    switch (value.runtimeType) {
      case String:
        await preferences?.setString(key, value);
        break;
      case int:
        await preferences?.setInt(key, value);
        break;
      case bool:
        await preferences?.setBool(key, value);
        break;
      case double:
        await preferences?.setDouble(key, value);
        break;
      default:
        return null;
    }
  }

  static Future<bool?> removeKey(String key) async {
    return await preferences?.remove(key);
  }

  static Future<bool?> clearData() async {
    return await preferences?.clear();
  }
}