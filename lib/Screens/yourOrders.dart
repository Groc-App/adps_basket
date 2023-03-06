// ignore: file_names
// ignore: file_names
// ignore_for_file: implementation_imports, file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/Widgets/Cart/Noitems.dart';
import 'package:your_basket/Widgets/YourOrderes/OrdereItem.dart';
import 'package:your_basket/models/product/productdetail.dart';

import '../models/orders/orders.dart';
import '../providers/providers.dart';

class YourOrderes extends ConsumerWidget {
  YourOrderes({super.key});

  bool islistempty = false;
  // String userid = '+917982733943';

  late final String orderID;
  late String totalAmount;
  late String date;
  late String address;
  late List<Map<String, dynamic>> orderDetails;

  Widget orderList(WidgetRef ref, BuildContext context, double scHeight,
      String phonenumber) {
    // print("\nInside orderList");
    final data = ref.watch(yourordersProvider(phonenumber));
    // print("\nInside orderList after it $data");

    return data.when(
      data: (list) {
        // print("Thisssssssssssssssssss is list ${list}");

        // if (list!.isEmpty == null) islistempty = true;
        // print("\n\n\nThis is list $islistempty");
        return orderlistbuilder(list, context, scHeight);
      },
      error: (_, __) => const Center(child: Text("ERRRRRRRRRRR")),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget orderlistbuilder(List<Orders>? list, contex, scHeight) {
    return list == null
        ? NoItems(
            noitemtext: 'You have no past orders!!!',
            pageroute: 'homescreen',
          )
        : Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: list.map<Widget>((e) {
                    return OrdereItem(
                        orderDetails: e.OrderDetails,
                        address: e.Addres,
                        orderID: e.OrderId,
                        date: e.Date,
                        orderStatus: e.OrderStatus,
                        totalAmount: e.TotalAmount.toString());
                  }).toList(),
                ),
              ),
            ],
          );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var authInfo = ref.watch(authCheckProvider);
    print(authInfo?.uid);

    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 237, 230, 230),
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text('Your Orders'),
        ),
        body: authInfo == null
            ? NoItems(
                noitemtext: 'Login/Signup first',
                pageroute: 'loginpage',
              )
            : orderList(ref, context, scHeight, authInfo.phoneNumber ?? ''));
  }
}
