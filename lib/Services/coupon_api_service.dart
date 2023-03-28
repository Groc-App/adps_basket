import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:your_basket/models/address/address.dart';
import 'package:your_basket/models/cart/cartitem.dart';
import 'package:your_basket/models/category/category.dart';
import 'package:your_basket/models/address/addressbook.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config.dart';
import '../models/address/selectedaddress.dart';

final couponApiService = Provider.autoDispose((ref) => APIServiceCoupon());

class APIServiceCoupon {
  static var client = http.Client();

  Future<String> checkcoupon(Map<String, String?> mp) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var u = "${Config.apiURL}${Config.checkOffer}";

    var url = Uri.parse(u);

    print(url);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({"number": mp['number'], "offerId": mp['code']}),
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

  Future<String> verifyReferral(String number) async {
    print("Inside verifyRefferral: $number");
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var u = "${Config.apiURL}${Config.verifyOffer}";

    var url = Uri.parse(u);

    print("This is verifyReferral url $url");

    var response = await client.post(
      headers: requestHeaders,
      url,
      body: jsonEncode({"number": number}),
    );

    print("This is response ${response.body}");

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print('Message:\n${data['message']}');
      return data['message'];
    } else {
      return '';
    }
  }
}
