import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config.dart';
import '../models/user/user.dart';

final userApiService = Provider.autoDispose((ref) => APIServiceUser());

class APIServiceUser {
  static var client = http.Client();

  Future<UserN?> getrefferalId(String number) async {
    print('Hii inside refferalId:::::::::');
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var ur = Config.getrefferalID + '/${number}';
    var url = Uri.http(Config.apiURL, ur);

    print("Url of ger refferral id $url");

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      return userNFromJson(data['data']);
    } else {
      return null;
    }
  }

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
