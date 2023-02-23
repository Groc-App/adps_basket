import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:your_basket/models/address/address.dart';
import 'package:your_basket/models/cart/cartitem.dart';
import 'package:your_basket/models/category/category.dart';
import 'package:your_basket/models/address/addressbook.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config.dart';
import '../models/address/selectedaddress.dart';

final addressApiService = Provider((ref) => APIServiceAddress());

class APIServiceAddress {
  static var client = http.Client();

  Future<void> addnewaddress(Map<String, String?> mp) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.addnewaddress);

    print(url);

    Map<String, String?> address = {
      "Recipients_Name": mp['Recipients_Name'],
      "Flat_FLoor_Tower": mp['Flat_FLoor_Tower'],
      "Street_Society": mp['Street_Society'],
      "City": mp['City'],
      "Pincode": mp['Pincode']
    };

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({"number": mp["number"], "address": address}),
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return null;
    } else {
      return null;
    }
  }

  Future<AddressBook?> fetchalladdressbyid() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.getalladdressbyid);

    String phonenumber = '+917982733943';

    print(url);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({"phonenumber": phonenumber}),
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return AddressBook.fromJson(data);
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
