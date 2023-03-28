import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config.dart';

final quoteApiService = Provider((ref) => APIServiceQuote());

class APIServiceQuote {
  static var client = http.Client();

  Future<String> getQuote() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var u = "${Config.apiURL}${Config.getQuote}";

    var url = Uri.parse(u);

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
