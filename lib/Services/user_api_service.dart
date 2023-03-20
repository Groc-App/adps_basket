import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config.dart';

final userApiService = Provider((ref) => APIServiceUser());

class APIServiceUser {
  static var client = http.Client();

  Future<String> createuserifnotexist(Map<String, String?> mp) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var ur = Config.createuserApi;

    var url = Uri.http(Config.apiURL, ur);

    print(url);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(
          {'number': mp['number'], 'refferalcode': mp['refferalcode']}),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data['message'];
    } else {
      return 'error';
    }
  }
}
