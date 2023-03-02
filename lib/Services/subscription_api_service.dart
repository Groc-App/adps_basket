import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:your_basket/models/cart/cartitem.dart';
import 'package:your_basket/models/orders/orders.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/models/product/productdetail.dart';
import 'package:your_basket/models/subscription/subscription.dart';
import '../config.dart';

final subscriptionApiService = Provider((ref) => APIServiceSubscription());

class APIServiceSubscription {
  static var client = http.Client();

  Future<List<Subscription>?> getSubscriptionbyUser(
      Map<String, String> map) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    final queryParameter = map;

    var url =
        Uri.http(Config.apiURL, Config.getSubscriptionByUser, queryParameter);

    print(url);

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    // print(response.body);

    if (true) {
      var data = jsonDecode(response.body);
      print(subscriptionFromJson(data['data']));
      return subscriptionFromJson(data['data']);
    } else {
      return null;
    }
  }

  Future<void> createsubscription(Map<String, dynamic> map) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    print("Map: $map");

    var body = json.encode(map);

    print("Body:::::$body");
    var url = Uri.http(Config.apiURL, Config.createSubscripiotn);

    print(url);

    var response = await client.post(url, headers: requestHeaders, body: body);

    print(response.body);

    if (true) {
      return null;
    } else {
      return null;
    }
  }

  Future<void> cancelSubscription(Map<String, dynamic> map) async {
    try {
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
      };

      final queryParameter = map;

      var body = json.encode(map);

      var url =
          Uri.http(Config.apiURL, Config.cancelSubscription, queryParameter);

      // print(url);

      var response = await client.delete(
        url,
        headers: requestHeaders,
      );

      // print(response.body);

      if (response.statusCode == 200) {
        return null;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
