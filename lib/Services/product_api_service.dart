// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/models/product/products.dart';
import '../config.dart';

final productApiService = Provider((ref) => APIServiceProducts());

class APIServiceProducts {
  static var client = http.Client();

  Future<List<Product>> getAllProduct() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.getAllProducts);
    print("\nThis is productData URL::");
    print(url);
    var response = await client.get(
      url,
      headers: requestHeaders,
    );
    var data = jsonDecode(response.body);
    print("\n\Response Product data:");
    print(data['data']);

    return productsFromJson(data['data']);
  }

  Future<List<Product>?> getAllProdcutsByCategory(
      Map<String, String> map) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    final queryParameter = map;
    var url = Uri.http(
        Config.apiURL, Config.getProductsByCategoriesApi, queryParameter);

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    Map<String, dynamic> prdcts;
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return productsFromJson(data['data']);
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

    var response;
    response = await client.get(
      url,
      headers: requestHeaders,
    );

    Map<String, dynamic> prdcts;
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      prdcts = data["data"];
      if (data["data"] == null) return productsFromJson(prdcts);
      return productsFromJson(prdcts['Products']);
    } else {
      return null;
    }
  }
}
