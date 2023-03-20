import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:your_basket/Widgets/Homepage/ProductItem.dart';
import 'package:your_basket/data/productsdata.dart';
import 'package:your_basket/models/cart/cartitem.dart';
import 'package:your_basket/models/category/category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config.dart';
import '../models/cart/cart.dart';

final cartApiService = Provider((ref) => APIServiceCart());

class APIServiceCart {
  static var client = http.Client();

  Future<void> placeorder(
      String number, String tamount, productlist, addressid) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var ur = Config.placeorderApi;
    var url = Uri.http(Config.apiURL, ur);

    print(url);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({
        "userid": number,
        "tamount": tamount,
        "orderdetail": productlist,
        "addressid": addressid,
      }),
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return null;
    } else {
      return null;
    }
  }

  Future<Cart?> getCartitemsApi(String? number) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    String userid = number ?? '';

    var ur = Config.getCartItemApi + '/${userid}';
    var url = Uri.http(Config.apiURL, ur);

    var response = await client.get(
      url,
      headers: requestHeaders,
      // body: jsonEncode({"phone": }),
    );

    var data = response.statusCode;

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return Cart.fromJson(data['data']);
    } else {
      return null;
    }
  }

  Future<void> addCartItem(String number, String productid) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var ur = Config.createcartitemApi;
    var url = Uri.http(Config.apiURL, ur);

    print(url);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({"productId": productid, "phonenumber": number}),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print("success in updating");
      return null;
    } else {
      print("failure");
      return null;
    }
  }

  Future<void> updatecartitem(
      String number, String qty, String productid) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var ur = Config.addorupdatecartitemApi;
    var url = Uri.http(Config.apiURL, ur);

    print(url);
    print(number);
    print(productid);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(
          {"productId": productid, "quantity": qty, "phonenumber": number}),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print("success in updating");
      return null;
    } else {
      print("failure");
      return null;
    }
  }

  Future<void> removeCartItem(String number, String productid) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var ur = Config.removeCartItem;
    var url = Uri.http(Config.apiURL, ur);

    print(url);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({"productId": productid, "phonenumber": number}),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print("success in deleting");
      return null;
    } else {
      print("failure");
      return null;
    }
  }
}
