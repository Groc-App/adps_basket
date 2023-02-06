import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:your_basket/models/category/category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config.dart';

final categoryApiService = Provider((ref) => APIServiceCategory());

class APIServiceCategory {
  static var client = http.Client();

  Future<List<Category>?> getCategory() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.getAllCategoryApi);

    var response = await client.get(
      url,
      headers: requestHeaders,
      // body: jsonEncode({"phone": }),
    );
    // print("Category");
    // print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return categoiesFromJson(data['data']);
    } else {
      return null;
    }
  }

  Future<List<Category>?> getmainCategory() async {
    print('h22222222222222222222222222222');

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.getAllmainCategoryApi);

    var response = await client.get(
      url,
      headers: requestHeaders,
      // body: jsonEncode({"phone": }),
    );
    // print("Category");
    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return categoiesFromJson(data['data']);
    } else {
      return null;
    }
  }
}
