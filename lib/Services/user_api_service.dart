import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config.dart';

final userApiService = Provider((ref) => APIServiceUser());

class APIServiceUser {
  static var client = http.Client();

  void createuserifnotexist(String? number) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var ur = Config.createuserApi + '/${number}';

    var url = Uri.http(Config.apiURL, ur);

    print(url);

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      return null;
    } else {
      return null;
    }
  }
}
