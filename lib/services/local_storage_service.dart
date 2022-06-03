import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    log('getToken called');
    return prefs.getString('token');
  }

  static storeToken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    log('storeToken called');
    prefs.setString('token', value);
  }

  static Future<bool> isLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    log('isLoggedIn called');
    return prefs.getString('token') != null;
  }
}
