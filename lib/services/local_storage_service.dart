import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

const kTokenKey = 'token';

class LocalStorageService {
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    log('getToken called');
    return prefs.getString(kTokenKey);
  }

  static Future<void> storeToken(String value) async {
    final prefs = await SharedPreferences.getInstance();
    log('storeToken called');
    await prefs.setString(kTokenKey, value);
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    log('isLoggedIn called');
    return prefs.getString(kTokenKey) != null;
  }

  static Future<void> deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    log('deleteToken called');
    await prefs.remove(kTokenKey);
  }
}
