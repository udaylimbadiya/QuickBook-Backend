import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static late SharedPreferences _preferences;

  static Future<void> initialize() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // String operations
  static Future<bool> setString(String key, String value) async {
    return await _preferences.setString(key, value);
  }

  static String? getString(String key, {String? defaultValue}) {
    return _preferences.getString(key) ?? defaultValue;
  }

  // Boolean operations
  static Future<bool> setBool(String key, bool value) async {
    return await _preferences.setBool(key, value);
  }

  static bool? getBool(String key, {bool? defaultValue}) {
    return _preferences.getBool(key) ?? defaultValue;
  }

  // Integer operations
  static Future<bool> setInt(String key, int value) async {
    return await _preferences.setInt(key, value);
  }

  static int? getInt(String key, {int? defaultValue}) {
    return _preferences.getInt(key) ?? defaultValue;
  }

  // Delete
  static Future<bool> remove(String key) async {
    return await _preferences.remove(key);
  }

  static Future<bool> clear() async {
    return await _preferences.clear();
  }

  // Check key exists
  static bool containsKey(String key) {
    return _preferences.containsKey(key);
  }
}