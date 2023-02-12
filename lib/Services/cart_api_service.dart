import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:your_basket/models/cart/cartitem.dart';
import 'package:your_basket/models/category/category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config.dart';

final cartApiService = Provider((ref) => APIServiceCart());

class APIServiceCart {
  static var client = http.Client();

  Future<List<CartItem>?> getCartItem(String? userid) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var ur = Config.getCartItemApi + '/${userid}';

    var url = Uri.http(Config.apiURL, ur);

    print(url);

    var response = await client.get(
      url,
      headers: requestHeaders,
      // body: jsonEncode({"phone": }),
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return cartitemFromJson(data['data']);
    } else {
      return null;
    }
  }

  void addorupdateProduct(Map<String, String> mp) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var ur = Config.addorupdatecartitemApi;

    var url = Uri.http(Config.apiURL, ur);

    print(url);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({
        "productId": mp['id'],
        "quantity": mp['quantity'],
        "userId": mp['userid']
      }),
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print("success");
      return null;
    } else {
      print("failure");
      return null;
    }
  }

  void updateCartitemquantity(Map<String, dynamic> cartitemdet) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    Map<String, dynamic> requestBody = {
      'id': cartitemdet['id'],
      'quantity': cartitemdet['quantity'],
    };

    var url = Uri.http(Config.apiURL, Config.getProductByIdApi);

    print(url);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: requestBody,
    );

    print(response.body);

    if (response.statusCode == 200) {
      print('Success');
      // var data = jsonDecode(response.body);
      // return productDetailFromJson(data['data']);
    } else {
      print('Failure');

      // return null;
    }
  }
}
