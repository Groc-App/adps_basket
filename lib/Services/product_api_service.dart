// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:your_basket/models/category/category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/models/product/products.dart';
import '../config.dart';

final productApiService = Provider((ref) => APIServiceProducts());

class APIServiceProducts {
  static var client = http.Client();

  Future<List<Product>?> getAllProdcutsByCategory(String category) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    // final queryParameter = {'category': category};
    String ur = Config.getProductsByCategoriesApi + '/${category}';
    var url = Uri.http(Config.apiURL, ur);
    print("This is url");
    print(url);
    var response = await client.get(
      url,
      headers: requestHeaders,
      // body: jsonEncode({"phone": }),
    );
    Map<String, dynamic> prdcts;
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      prdcts = data['data'];

      print("Product response::");
      print(prdcts['Products']);
      return productsFromJson(prdcts['Products']);
    } else {
      return null;
    }
  }

  Future<List<Product>?> getAllProdcutsMostSelling() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.getProductsMostSellingApi);
    print("This is url");
    print(url);
    var response = await client.get(
      url,
      headers: requestHeaders,
      // body: jsonEncode({"phone": }),
    );

    print(response.body);
    Map<String, dynamic> prdcts;
    if (response.statusCode == 200) {
      print('hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii');
      var data = jsonDecode(response.body);
      prdcts = data["data"];

      print("Product response::");
      print(prdcts['Products']);

      print('byeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      return productsFromJson(prdcts['Products']);
    } else {
      return null;
    }
  }
}
