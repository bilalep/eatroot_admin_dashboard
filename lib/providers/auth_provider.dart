import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:tech_test/models/base_user/user.dart';
import 'package:tech_test/services/local_storage_service.dart';

import '../models/base_user/base_user.dart';
import 'package:flutter/material.dart';
import 'package:tech_test/models/base_user/base_user.dart';

import '../utils/constants.dart';

class AuthProvider with ChangeNotifier {
  BaseUser? baseUser;

  final bool _tokenPushed = false;

  bool get isAuthenticated => baseUser != null;

  bool get isTokenPushed => _tokenPushed;

  User? get userDetails => baseUser?.user;

  bool _loading = false;

  bool get loading => _loading;

  // String? get token => baseUser?.token;

  signIn({required String userName, required String password}) async {
    _loading = true;
    notifyListeners();
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };

    http.Request request =
        http.Request('POST', Uri.parse('$endpoint/auth/login'));

    request.body = json.encode({"username": userName, "password": password});
    request.headers.addAll(headers);

    http.StreamedResponse streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (streamedResponse.statusCode == 200) {
      baseUser = BaseUser.fromJson(response.body);
      await LocalStorageService.storeToken(baseUser!.token!);
      kBearerToken = baseUser!.token!;
    } else {
      log('Authorisation failed: ${response.reasonPhrase}');
    }
    _loading = false;
    notifyListeners();
  }
}
