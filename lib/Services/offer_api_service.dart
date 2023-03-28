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
      var u = "${Config.apiURL}${Config.getAllOffers}";

      var url = Uri.parse(u);
      print("url:$url");

      var response = await client.post(
        url,
        headers: requestHeaders,
        body: jsonEncode({"number": map['number']}),
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

      var u = "${Config.apiURL}${Config.updateOffer}";

      var url = Uri.parse(u);
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
