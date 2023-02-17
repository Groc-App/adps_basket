// ignore: file_names
// ignore: file_names
// ignore_for_file: implementation_imports, file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/Widgets/Cart/Noitems.dart';
import 'package:your_basket/Widgets/YourOrderes/OrdereItem.dart';

import '../providers/providers.dart';

class YourOrderes extends ConsumerWidget {
  YourOrderes({super.key});

  bool islistempty = false;
  String userid = '+917982733943';

  Widget orderList(WidgetRef ref, BuildContext context, double scHeight) {
    print("\nInside orderList");
    final data = ref.watch(yourordersProvider(userid));
    print("\nInside orderList");

    return data.when(
      data: (list) {
        print("Thisssssssssssssssssss is list ${list}");

        if (list == null) islistempty = true;
        print("\n\n\nThis is list $islistempty");
        return orderlistbuilder(list, context, scHeight);
      },
      error: (_, __) => const Center(child: Text("ERRRRRRRRRRR")),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget orderlistbuilder(list, contex, scHeight) {
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
                        orderID: e.OrderId,
                        // date: e.Date,
                        totalAmount: e.TotalAmount.toString());
                  }).toList(),
                ),
              ),
            ],
          );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // var authInfo = ref.watch(authCheckProvider);
    // print(authInfo?.uid);

    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 237, 230, 230),
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text('Your Orders'),
        ),
        body:
            // authInfo == null?
            //  NoItems(
            //         noitemtext: 'Login/Signup first',
            //         pageroute: 'loginpage',
            //       ),
            // :

            orderList(ref, context, scHeight));
  }
}
