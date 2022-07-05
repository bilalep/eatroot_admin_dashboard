import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

const kTokenKey = 'token';
const kUserNameKey = 'userName';

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

  static Future<void> clearLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    log('clearLocalStorage called');
    await prefs.clear();
  }

  static Future<void> storeUserName(String userName) async {
    final prefs = await SharedPreferences.getInstance();
    log('storeUserName called');
    await prefs.setString(kUserNameKey, userName);
  }

  static Future<String?> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    log('getUserName called');
    return prefs.getString(kUserNameKey);
  }
}
