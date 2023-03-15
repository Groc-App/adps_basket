import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:your_basket/models/offer/offer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config.dart';

final offerApiService = Provider.autoDispose((ref) => APIServiceOffer());

class APIServiceOffer {
  static var client = http.Client();

  Future<List<Offer>?> getAllOffers(Map<String, String> map) async {
    try {
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
      };

      final queryParameter = map;
      var url = Uri.http(Config.apiURL, Config.getAllOffers, queryParameter);

      var response = await client.get(
        url,
        headers: requestHeaders,
      );
      var data = jsonDecode(response.body);

      return offerFromJson(data['data']);
    } catch (err) {
      print(err);
      return null;
    }
  }

  Future<void> updateOffer(Map<String, String> map) async {
    try {
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
      };

      var url = Uri.http(Config.apiURL, Config.updateOffer);
      var body = json.encode(map);

      var response =
          await client.patch(url, headers: requestHeaders, body: body);
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return null;
      } else {
        return null;
      }
    } catch (err) {
      print(err);
      return null;
    }
  }
}
