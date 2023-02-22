import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:your_basket/models/address/address.dart';
import 'package:your_basket/models/cart/cartitem.dart';
import 'package:your_basket/models/category/category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config.dart';
import '../models/address/selectedaddress.dart';

final addressApiService = Provider((ref) => APIServiceAddress());

class APIServiceAddress {
  static var client = http.Client();

  Future<List<Address>?> fetchalladdressbyid(String? phonenumber) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.getalladdressbyid);

    print(url);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({"phonenumber": phonenumber}),
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return addressFromJson(data['data']);
    } else {
      return null;
    }
  }

  Future<SelectedAddress?> fetchselectedaddress(String? phonenumber) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var ur = Config.getselectedaddress + '/$phonenumber';

    var url = Uri.http(Config.apiURL, ur);

    print(url);

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return SelectedAddress.fromJson(data['data']);
    } else {
      return null;
    }
  }
}
