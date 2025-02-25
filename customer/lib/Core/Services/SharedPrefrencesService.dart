// ignore_for_file: file_names

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  Future<void> saveString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<void> clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  Future<void> deleteString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  Future<void> saveBool(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  Future<void> saveDouble(String key, double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(key, value);
  }

  Future<void> saveInt(String key, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  Future<void> saveStringList(String key, List<String> value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(key, value);
  }

  Future<String?> getString(String key) async {
    String? value;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    value = prefs.getString(key);
    return value;
  }

  Future<bool?> getBool(String key) async {
    bool? value;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    value = prefs.getBool(key);
    if (value != null) {
      return value;
    } else {
      return false;
    }
  }

  Future<double?> getDouble(String key) async {
    double? value;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    value = prefs.getDouble(key);
    return value!;
  }

  Future<int?> getInt(String key) async {
    int? value;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    value = prefs.getInt(key);
    return value!;
  }

  Future<List<String?>> getStringList(String key) async {
    List<String>? value;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    value = prefs.getStringList(key);
    return value!;
  }
}
