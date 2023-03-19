import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:your_basket/models/address/address.dart';
import 'package:your_basket/models/cart/cartitem.dart';
import 'package:your_basket/models/category/category.dart';
import 'package:your_basket/models/address/addressbook.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config.dart';
import '../models/address/selectedaddress.dart';

final couponApiService = Provider((ref) => APIServiceCoupon());

class APIServiceCoupon {
  static var client = http.Client();

  Future<String> checkcoupon(Map<String, String?> mp) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.addnewaddress);

    print(url);

    var response = await client.post(
      url,
      body: jsonEncode({"number": mp['number'], "code": mp['code']}),
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return '';
    } else {
      return '';
    }
  }

  Future<void> deleteaddress(String number, String addressId) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.deleteaddress);

    print('User id is $number\n addressid is $addressId\n');

    print(url);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({"number": number, "addressid": addressId}),
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return null;
    } else {
      return null;
    }
  }

  Future<void> updateaddress(
      Map<String, String?> addressdetail, String addressId) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.updateaddress);

    print('User id is \n addressid is ${addressId}\n');

    print(url);

    Map<String, String?> address = {
      "Recipients_Name": addressdetail['Recipients_Name'],
      "Flat_FLoor_Tower": addressdetail['Flat_FLoor_Tower'],
      "Street_Society": addressdetail['Street_Society'],
      "City": addressdetail['City'],
      "Pincode": addressdetail['Pincode'],
    };

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({"addressId": addressId, "addressinfo": address}),
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return null;
    } else {
      return null;
    }
  }

  Future<AddressBook?> fetchalladdressbyid(String? number) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.getalladdressbyid);

    String? phonenumber = number;

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

  Future<void> setSelectedaddress(String phonenumber, String addressId) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.setSelectedaddress);

    print(url);

    var response = await client.post(url,
        headers: requestHeaders,
        body: jsonEncode({
          "number": phonenumber,
          "addressid": addressId,
        }));

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return null;
    } else {
      return null;
    }
  }
}
