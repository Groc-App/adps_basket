// ignore: file_names
// ignore: file_names
// ignore_for_file: implementation_imports, file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/Widgets/Cart/Noitems.dart';
import 'package:your_basket/Widgets/Errors/Dataloadingerror.dart';
import 'package:your_basket/Widgets/YourOrderes/OrdereItem.dart';
import 'package:your_basket/models/product/productdetail.dart';

import '../models/orders/orders.dart';
import '../providers/providers.dart';

class YourOrderes extends ConsumerStatefulWidget {
  // YourOrderes({super.key});

  @override
  _YourOrderesState createState() => _YourOrderesState();
}

class _YourOrderesState extends ConsumerState<YourOrderes>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  bool islistempty = false;
  // String userid = '+917982733943';

  late final String orderID;
  late String totalAmount;
  late String date;
  late String address;
  late List<Map<String, dynamic>> orderDetails;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    )..forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget orderList(WidgetRef ref, BuildContext context, double scHeight,
      String phonenumber) {
    // print("\nInside orderList");
    final data = ref.watch(yourordersProvider(phonenumber));
    // print("\nInside orderList after it $data");

    return data.when(
      data: (list) {
        print("Thisssssssssssssssssss is list ${list}");

        if (list == null || list.isEmpty) islistempty = true;
        print("\n\n\nThis is list $islistempty");
        return orderlistbuilder(list, context, scHeight);
      },
      error: (_, __) => DataError(),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget orderlistbuilder(List<Orders>? list, contex, scHeight) {
    return list == null || list.isEmpty
        ? NoItems(
            noitemtext: 'You have no past orders!!!',
            pageroute: 'homescreen',
          )
        : ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final order = list[index];
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(-1, 0),
                  end: Offset.zero,
                ).animate(CurvedAnimation(
                  parent: _animationController,
                  curve:
                      Interval(index / list.length, 1.0, curve: Curves.easeOut),
                )),
                child: OrdereItem(
                    orderDetails: order.OrderDetails,
                    address: order.Addres,
                    orderID: order.OrderId,
                    date: order.Date,
                    orderStatus: order.OrderStatus,
                    totalAmount: order.TotalAmount.toString()),
              );
            },
          );

    // SingleChildScrollView(
    //     child: Column(
    //       children: list.map<Widget>((e) {
    //         return OrdereItem(
    //             orderDetails: e.OrderDetails,
    //             address: e.Addres,
    //             orderID: e.OrderId,
    //             date: e.Date,
    //             orderStatus: e.OrderStatus,
    //             totalAmount: e.TotalAmount.toString());
    //       }).toList(),
    //     ),
    //   );
  }

  @override
  Widget build(BuildContext context) {
    var authInfo = ref.watch(authCheckProvider);
    // print(authInfo?.uid);

    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Orders'),
        ),
        body: authInfo == null
            ? NoItems(
                noitemtext: 'Login/SignUp First',
                pageroute: 'loginpage',
              )
            : orderList(ref, context, scHeight, authInfo));
  }
}
