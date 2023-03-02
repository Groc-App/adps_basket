import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:your_basket/models/cart/cartitem.dart';
import 'package:your_basket/models/orders/orders.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/models/product/productdetail.dart';
import '../config.dart';

final orderApiService = Provider((ref) => APIServiceOrder());

class APIServiceOrder {
  static var client = http.Client();

  Future<List<Orders>?> getOrdersbyId(String userid) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    print("\nInside getORdersbyId");

    var ur = Config.getOrderbyIdApi + '/${userid}';

    var url = Uri.http(Config.apiURL, ur);

    print(url);

    var response = await client.get(
      url,
      headers: requestHeaders,
      // body: jsonEncode({"phone": }),
    );

    // print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print("This is data ${data['data']}");
      // var tempdata = data['data'];
      return ordersFromJson(data['data']);
    } else {
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

    var url = Uri.http(Config.apiURL, Config.getProductByIdApi);

    print(url);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: requestBody,
    );

    print(response.body);

    if (response.statusCode == 200) {
      print('Success');
      // var data = jsonDecode(response.body);
      // return productDetailFromJson(data['data']);
    } else {
      print('Failure');

      // return null;
    }
  }
}
