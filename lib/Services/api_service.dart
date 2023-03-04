import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:your_basket/models/cart/cartitem.dart';
import 'package:your_basket/models/category/category.dart';
import 'package:your_basket/models/otp_login_screen_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config.dart';
import '../models/product/productdetail.dart';

final authApiService = Provider((ref) => APIServiceAuth());

class APIServiceAuth {
  static var client = http.Client();

  // static Future<LoginResponseModel> otpLogin(String mobileNo) async {
  //   Map<String, String> requestHeaders = {
  //     'Content-Type': 'application/json',
  //   };

  //   var url = Uri.http(Config.apiURL, Config.otpLoginAPI);

  //   var response = await client.post(
  //     url,
  //     headers: requestHeaders,
  //     body: jsonEncode({"phone": mobileNo}),
  //   );

  //   print("Rse:");
  //   print(response.body);

  //   return loginResponseJson(response.body);
  // }

  // Future<List<Category>?> getCategory() async {
  //   Map<String, String> requestHeaders = {
  //     'Content-Type': 'application/json',
  //   };

  //   var url = Uri.http(Config.apiURL, Config.getCategoryApi);

  //   var response = await client.get(
  //     url,
  //     headers: requestHeaders,
  //     // body: jsonEncode({"phone": }),
  //   );

  //   print(response.body);

  //   if (response.statusCode == 200) {
  //     var data = jsonDecode(response.body);
  //     return categoiesFromJson(data['data']);
  //   } else {
  //     return null;
  //   }
  // }

  Future<ProductItem?> getproductDetail(productid) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var ur = Config.getProductByIdApi + '/${productid}';

    var url = Uri.http(Config.apiURL, ur);

    print(url);

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    // print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data['data']);
      return productDetailFromJson(data['data']);
    } else {
      return null;
    }
  }

  static Future<LoginResponseModel> verifyOtp(
    String mobileNo,
    String otpHash,
    String otpCode,
  ) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.otpVerifyAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({"phone": mobileNo, "otp": otpCode, "hash": otpHash}),
    );

    return loginResponseJson(response.body);
  }
}
