import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:your_basket/Widgets/Homepage/ProductItem.dart';
import 'package:your_basket/data/productsdata.dart';
import 'package:your_basket/models/cart/cartitem.dart';
import 'package:your_basket/models/category/category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config.dart';
import '../models/cart/cart.dart';

final cartApiService = Provider((ref) => APIServiceCart());

class APIServiceCart {
  static var client = http.Client();

  Future<void> placeorder(String number, String tamount, productlist) async {
    print('Inside Api\n');

    print('$number\n');
    print('$tamount\n');
    print('$productlist\n');

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    // abhi userid fetch krni h

    // var userid = '+917982733943';

    var ur = Config.placeorderApi;

    var url = Uri.http(Config.apiURL, ur);

    // print("\n\nInside Oder Api");
    // print("\n\nObj Received $obj");
    // print("\n\nObj ProductList Received ${obj['productlist']}");

    print(url);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({
        "userid": number,
        "tamount": tamount,
        "orderdetail": productlist
      }),
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return null;
    } else {
      return null;
    }
  }

  Future<Cart?> getCartitemsApi() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    print("\n\nINside Get Cart Items");
    // String userid = authInfo.phoneNumber;
    String userid = '+917982733943';

    var ur = Config.getCartItemApi + '/${userid}';

    var url = Uri.http(Config.apiURL, ur);

    print(url);

    var response = await client.get(
      url,
      headers: requestHeaders,
      // body: jsonEncode({"phone": }),
    );

    var data = response.statusCode;
    // print(response.body['data']['CartItem']['Item']);
    print("This is data after fetch$data");

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print('\n\n\n');
      print("This is data after fetch$data");

      return Cart.fromJson(data['data']);
    } else {
      return null;
    }
  }

  Future<void> addCartItem(String number, String productid) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var ur = Config.createcartitemApi;

    var url = Uri.http(Config.apiURL, ur);

    print(url);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({"productId": productid, "phonenumber": number}),
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print("success in updating");
      return null;
    } else {
      print("failure");
      return null;
    }
  }

  Future<void> updatecartitem(
      String number, String qty, String productid) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var ur = Config.addorupdatecartitemApi;

    var url = Uri.http(Config.apiURL, ur);

    print(url);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(
          {"productId": productid, "quantity": qty, "phonenumber": number}),
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print("success in updating");
      return null;
    } else {
      print("failure");
      return null;
    }
  }

  Future<void> removeCartItem(String number, String productid) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    print('inside cart item ${productid}');


    var ur = Config.removeCartItem;

    var url = Uri.http(Config.apiURL, ur);

    print(url);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({"productId": productid, "phonenumber": number}),
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print("success in deleting");
      return null;
    } else {
      print("failure");
      return null;
    }
  }

  // Future<List<CartItem>?> getCartItem(String? userid) async {
  //   Map<String, String> requestHeaders = {
  //     'Content-Type': 'application/json',
  //   };

  //   var ur = Config.getCartItemApi + '/${userid}';

  //   var url = Uri.http(Config.apiURL, ur);

  //   print(url);

  //   var response = await client.get(
  //     url,
  //     headers: requestHeaders,
  //     // body: jsonEncode({"phone": }),
  //   );

  //   print(response.body);
  //   print('\n\n\n');
  //   // var data = response.body;
  //   // print(response.body['data']['CartItem']['Item']);

  //   if (response.statusCode == 200) {
  //     var data = jsonDecode(response.body);
  //     print(data);
  //     var data1 = data['data'];
  //     var data2 = data1['CartItem'];
  //     print('yooooooooooooooooooooo');
  //     print(data2);

  //     return cartitemFromJson(data1['CartItem']);
  //   } else {
  //     return null;
  //   }
  // }

  // void addorupdateProduct(Map<String, String> mp) async {
  //   Map<String, String> requestHeaders = {
  //     'Content-Type': 'application/json',
  //   };

  //   var ur = Config.addorupdatecartitemApi;

  //   var url = Uri.http(Config.apiURL, ur);

  //   print(url);

  //   var response = await client.post(
  //     url,
  //     headers: requestHeaders,
  //     body: jsonEncode({
  //       "productId": mp['id'],
  //       "quantity": mp['quantity'],
  //       "phonenumber": mp['userid']
  //     }),
  //   );

  //   print(response.body);

  //   if (response.statusCode == 200) {
  //     var data = jsonDecode(response.body);
  //     print("success in updating");
  //     return null;
  //   } else {
  //     print("failure");
  //     return null;
  //   }
  // }

  // void updateCartitemquantity(Map<String, dynamic> cartitemdet) async {
  //   Map<String, String> requestHeaders = {
  //     'Content-Type': 'application/json',
  //   };

  //   Map<String, dynamic> requestBody = {
  //     'id': cartitemdet['id'],
  //     'quantity': cartitemdet['quantity'],
  //   };

  //   var url = Uri.http(Config.apiURL, Config.getProductByIdApi);

  //   print(url);

  //   var response = await client.post(
  //     url,
  //     headers: requestHeaders,
  //     body: requestBody,
  //   );

  //   print(response.body);

  //   if (response.statusCode == 200) {
  //     print('Success');
  //     // var data = jsonDecode(response.body);
  //     // return productDetailFromJson(data['data']);
  //   } else {
  //     print('Failure');

  //     // return null;
  //   }
  // }
}
