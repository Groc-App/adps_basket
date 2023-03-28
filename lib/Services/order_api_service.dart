import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:your_basket/models/orders/orders.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config.dart';

final orderApiService = Provider((ref) => APIServiceOrder());

class APIServiceOrder {
  static var client = http.Client();

  Future<List<Orders>?> getOrdersbyId(String userid) async {
    try {
      print('yassssssssssss');
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
      };

      var u = "${Config.apiURL}${Config.getOrderbyIdApi}${userid}";

      // var ur = Config.getOrderbyIdApi + '/${userid}';
      var url = Uri.parse(u);

      print(url);

      var response = await client.get(
        url,
        headers: requestHeaders,
      );

      var data = jsonDecode(response.body);
      if (response.statusCode != 400) {
        return ordersFromJson(data['data']);
      } else {
        return null;
      }
    } catch (_) {
      print(_);
      return null;
    }
  }

  void updateCartitemquantity(Map<String, dynamic> cartitemdet) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    Map<String, dynamic> requestBody = {
      'id': cartitemdet['id'],
      'quantity': cartitemdet['quantity'],
    };

    var u = "${Config.apiURL}${Config.getProductByIdApi}";

    var url = Uri.parse(u);

    print(url);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: requestBody,
    );

    if (response.statusCode == 200) {
      print('Success');
    } else {
      print('Failure');
    }
  }
}
