import 'dart:convert';
import 'package:http/http.dart' as http;
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

    var u = "${Config.apiURL}${Config.addnewaddress}";
    var url = Uri.parse(u);

    Map<String, String?> address = {
      "Recipients_Name": mp['Recipients_Name'],
      "Flat_FLoor_Tower": mp['Flat_FLoor_Tower'],
      "Street_Society": mp['Street_Society'],
      "City": mp['City'],
      "Pincode": mp['Pincode']
    };

    // ignore: unused_local_variable
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({"number": mp["number"], "address": address}),
    );

    // if (response.statusCode == 200) {
    //   var data = jsonDecode(response.body);
    //   return null;
    // } else {
    //   return null;
    // }
  }

  Future<void> deleteaddress(String number, String addressId) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var u = "${Config.apiURL}${Config.deleteaddress}";
    var url = Uri.parse(u);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({"number": number, "addressid": addressId}),
    );

    if (response.statusCode == 200) {
      return;
    } else {
      return;
    }
  }

  Future<void> updateaddress(
      Map<String, String?> addressdetail, String addressId) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var u = "${Config.apiURL}${Config.updateaddress}";
    var url = Uri.parse(u);

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

    if (response.statusCode == 200) {
      return;
    } else {
      return;
    }
  }

  Future<AddressBook?> fetchalladdressbyid(String? number) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var u = "${Config.apiURL}${Config.getalladdressbyid}";

    var url = Uri.parse(u);

    String? phonenumber = number;

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({"phonenumber": phonenumber}),
    );

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

    var u = "${Config.apiURL}${Config.getselectedaddress}/$phonenumber}";

    var url = Uri.parse(u);

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

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

    var u = "${Config.apiURL}${Config.setSelectedaddress}";

    var url = Uri.parse(u);

    var response = await client.post(url,
        headers: requestHeaders,
        body: jsonEncode({
          "number": phonenumber,
          "addressid": addressId,
        }));

    if (response.statusCode == 200) {
      return;
    } else {
      return;
    }
  }
}
