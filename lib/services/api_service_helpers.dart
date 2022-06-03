import 'dart:developer';

import 'package:http/http.dart' as http;

import 'package:tech_test/utils/constants.dart';

Future<http.StreamedResponse> callApi(
  String responseMethod,
  String apiPath,
) async {
  final headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': kBearerToken
  };
  final request = http.Request(responseMethod, Uri.parse('$endpoint/$apiPath'));
  request.headers.addAll(headers);
  return request.send();
}

Future<String?> checkResponseStatus(http.StreamedResponse response) async {
  if (response.statusCode == 200) {
    log('Live order Response status: ${response.statusCode}');
    return response.stream.bytesToString();
  } else {
    log(response.reasonPhrase ?? 'Unknown error');
    return null;
  }
}
