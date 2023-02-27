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

      print("This is url");
      print(url);

      var response = await client.get(
        url,
        headers: requestHeaders,
      );

      // if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      // print("Product response::");
      // print(data['data']);
      // print(offerFromJson(data['data']));

      return offerFromJson(data['data']);
      // } else {
      //   return null;
      // }
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

      print("This is url");
      print(url);

      var body = json.encode(map);

      print("This is body $body");

      var response =
          await client.patch(url, headers: requestHeaders, body: body);

      // if (response.statusCode == 200) {
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
