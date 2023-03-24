import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/models/subscription/subscription.dart';
import '../config.dart';

final subscriptionApiService = Provider((ref) => APIServiceSubscription());

class APIServiceSubscription {
  static var client = http.Client();

  Future<String> getQuote() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.getQuote);

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print('\n${data['data']}');
      return data['data'];
    } else {
      return '';
    }
  }
}
