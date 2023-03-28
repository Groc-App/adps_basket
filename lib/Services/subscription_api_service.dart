import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/models/subscription/subscription.dart';
import '../config.dart';

final subscriptionApiService = Provider((ref) => APIServiceSubscription());

class APIServiceSubscription {
  static var client = http.Client();

  Future<List<Subscription>?> getSubscriptionbyUser(String number) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    final queryParameter = {'number': number};

    var u = "${Config.apiURL}${Config.getSubscriptionByUser}/${queryParameter}";

    var url = Uri.parse(u);

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (true) {
      var data = jsonDecode(response.body);
      return subscriptionFromJson(data['data']);
    } else {
      return null;
    }
  }

  Future<void> createsubscription(Map<String, dynamic> map) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var body = json.encode(map);

    var u = "${Config.apiURL}${Config.createSubscripiotn}";

    var url = Uri.parse(u);

    var response = await client.post(url, headers: requestHeaders, body: body);

    if (true) {
      return null;
    } else {
      return null;
    }
  }

  Future<void> editsubscription(Map<String, dynamic> map) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.editSubscripiotn);

    var response = await client.post(url,
        headers: requestHeaders,
        body: jsonEncode({
          'subsid': map['subsid'],
          'quantity': map['quantity'],
          'startDate': map['startDate'],
          'endDate': map['endDate'],
          'address': map['address'],
        }));

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

      var response = await client.delete(
        url,
        headers: requestHeaders,
      );

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
