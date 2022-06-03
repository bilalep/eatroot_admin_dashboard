import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    log('getToken called');
    return prefs.getString('token');
  }

  static Future<void> storeToken(String value) async {
    final prefs = await SharedPreferences.getInstance();
    log('storeToken called');
    await prefs.setString('token', value);
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    log('isLoggedIn called');
    return prefs.getString('token') != null;
  }
}
