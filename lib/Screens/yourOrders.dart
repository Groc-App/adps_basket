// ignore: file_names
// ignore_for_file: implementation_imports, file_names, duplicate_ignore, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:your_basket/Widgets/Cart/Noitems.dart';
import 'package:your_basket/Widgets/Errors/Dataloadingerror.dart';
import 'package:your_basket/Widgets/YourOrderes/OrdereItem.dart';

import '../models/orders/orders.dart';
import '../providers/providers.dart';

String userNumber = '';

class YourOrderes extends ConsumerStatefulWidget {
  const YourOrderes({super.key});

  @override
  _YourOrderesState createState() => _YourOrderesState();
}

class _YourOrderesState extends ConsumerState<YourOrderes>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  bool islistempty = false;

  late final String orderID;
  late String totalAmount;
  late String date;
  late String address;
  late List<Map<String, dynamic>> orderDetails;

  @override
  void initState() {
    super.initState();
    getNumber();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> getNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userNumberr = prefs.getString('username') ?? '';
    setState(() {
      userNumber = userNumberr;
    });
  }

  Widget orderList(WidgetRef ref, BuildContext context, double scHeight,
      String phonenumber) {
    final data = ref.watch(yourordersProvider(phonenumber));

    return data.when(
      data: (list) {
        if (list == null || list.isEmpty) islistempty = true;
        return orderlistbuilder(list, context, scHeight);
      },
      error: (_, __) => const DataError(),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget orderlistbuilder(List<Orders>? list, contex, scHeight) {
    return list == null || list.isEmpty
        ? const NoItems(
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
  }

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Orders'),
        ),
        body: userNumber == ''
            ? const NoItems(
                noitemtext: 'Login/SignUp First',
                pageroute: 'loginpage',
              )
            : orderList(ref, context, scHeight, userNumber));
  }
}
