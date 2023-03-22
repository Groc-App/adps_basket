import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:your_basket/models/address/address.dart';
import 'package:your_basket/models/cart/cartitem.dart';
import 'package:your_basket/models/category/category.dart';
import 'package:your_basket/models/address/addressbook.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config.dart';
import '../models/address/selectedaddress.dart';

final couponApiService = Provider((ref) => APIServiceCoupon());

class APIServiceCoupon {
  static var client = http.Client();

  Future<String> checkcoupon(Map<String, String?> mp) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.checkOffer);

    print(url);

    var response = await client.post(
      url,
      body: jsonEncode({"number": mp['number'], "code": mp['code']}),
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print('\n${data['message']}');
      return data['message'];
    } else {
      return '';
    }
  }

  Future<String> verifyReferral(Map<String, String?> mp) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.checkOffer);

    print(url);

    var response = await client.post(
      url,
      body: jsonEncode({"number": mp['number'], "code": mp['code']}),
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print('\n${data['message']}');
      return data['message'];
    } else {
      return '';
    }
  }
}
