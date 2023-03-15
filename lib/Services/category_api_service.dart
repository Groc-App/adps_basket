import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:your_basket/models/category/category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config.dart';

final categoryApiService = Provider((ref) => APIServiceCategory());

class APIServiceCategory {
  static var client = http.Client();

  Future<List<Category>?> getCategory(String mainCategoryId) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    String ur = Config.getAllCategoryByMainCategory + '/${mainCategoryId}';
    var url = Uri.http(Config.apiURL, ur);

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return categoiesFromJson(data['data']);
    } else {
      return null;
    }
  }

  Future<List<Category>?> getmainCategory() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.getAllmainCategoryApi);
    print(url);

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return categoiesFromJson(data['data']);
    } else {
      return null;
    }
  }
}
