import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tech_test/models/base_user/base_user.dart';
import 'package:tech_test/models/base_user/user.dart';
import 'package:tech_test/services/local_storage_service.dart';
import 'package:tech_test/utils/constants.dart';

class AuthProvider with ChangeNotifier {
  BaseUser? baseUser;

  final bool _tokenPushed = false;

  bool get isAuthenticated => baseUser != null;

  bool get isTokenPushed => _tokenPushed;

  User? get userDetails => baseUser?.user;

  bool _loading = false;

  bool get loading => _loading;

  // String? get token => baseUser?.token;

  Future<void> signIn({
    required String userName,
    required String password,
  }) async {
    _loading = true;
    notifyListeners();
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };

    final request = http.Request('POST', Uri.parse('$endpoint/auth/login'))
      ..body = json.encode({'username': userName, 'password': password});
    request.headers.addAll(headers);

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    if (streamedResponse.statusCode == 200) {
      baseUser = BaseUser.fromJson(response.body);
      await LocalStorageService.storeToken(baseUser!.token!);
      await LocalStorageService.storeUserName(baseUser!.user!.name ?? 'User');
      kBearerToken = baseUser!.token!;
      kUserName = baseUser!.user!.name ?? 'User';
    } else {
      log('Authorization failed: ${response.reasonPhrase} ${response.statusCode}');
    }
    _loading = false;
    notifyListeners();
  }

  Future<void> signOut() async {
    baseUser = null;
    await LocalStorageService.clearLocalStorage();
    log('User signed out');
    notifyListeners();
  }
}
