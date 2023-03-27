import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config.dart';
import '../models/product/productdetail.dart';

final authApiService = Provider((ref) => APIServiceAuth());

class APIServiceAuth {
  static var client = http.Client();

  Future<ProductItem?> getproductDetail(productid) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var ur = '${Config.getProductByIdApi}/$productid';

    var url = Uri.http(Config.apiURL, ur);

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    // print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return productDetailFromJson(data['data']);
    } else {
      return null;
    }
  }
}
