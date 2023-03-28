import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config.dart';
import '../models/cart/cart.dart';

final cartApiService = Provider((ref) => APIServiceCart());

class APIServiceCart {
  static var client = http.Client();

  Future<String> placeorder(
      String number, String tamount, productlist, addressid, couponCode) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var u = "${Config.apiURL}${Config.placeorderApi}";

    var url = Uri.parse(u);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({
        "userid": number,
        "tamount": tamount,
        "orderdetail": productlist,
        "addressid": addressid,
        "offerId": couponCode
      }),
    );

    if (response.statusCode == 200) {
      return 'success';
    } else {
      return '';
    }
  }

  Future<Cart?> getCartitemsApi(String? number) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    String userid = number ?? '';

    var u = "${Config.apiURL}${Config.getCartItemApi}/$userid";
    var url = Uri.parse(u);

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

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

    var u = "${Config.apiURL}${Config.createcartitemApi}";

    // var ur = Config.createcartitemApi;
    var url = Uri.parse(u);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({"productId": productid, "phonenumber": number}),
    );

    if (response.statusCode == 200) {
      return null;
    } else {
      return null;
    }
  }

  Future<void> updatecartitem(
      String number, String qty, String productid) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var u = "${Config.apiURL}${Config.addorupdatecartitemApi}";

    var url = Uri.parse(u);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(
          {"productId": productid, "quantity": qty, "phonenumber": number}),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return null;
    } else {
      return null;
    }
  }

  Future<void> removeCartItem(String number, String productid) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var u = "${Config.apiURL}${Config.removeCartItem}";

    var url = Uri.parse(u);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({"productId": productid, "phonenumber": number}),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return null;
    } else {
      return null;
    }
  }
}
