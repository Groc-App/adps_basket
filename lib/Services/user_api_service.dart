import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:your_basket/models/cart/cartitem.dart';
import 'package:your_basket/models/category/category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config.dart';

final userApiService = Provider((ref) => APIServiceUser());

class APIServiceUser {
  static var client = http.Client();

  void createuserifnotexist(String? number) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var user = Config.createuserApi + '/${number}';

    var url = Uri.http(Config.apiURL, Config.createuserApi);

    print(url);

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    print(response.body);

    if (response.statusCode == 200) {
      return null;
    } else {
      return null;
    }
  }
}
