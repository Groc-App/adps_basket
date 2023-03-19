// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:your_basket/models/address/address.dart';

class OrdereItem extends StatelessWidget {
  // const OrdereItem({super.key});

  final String orderID;
  String totalAmount;
  DateTime date;
  Address address;
  String orderStatus;
  // String imageUrl;
  List<Map<String, dynamic>> orderDetails;

  OrdereItem(
      {required this.orderID,
      required this.date,
      required this.address,
      required this.orderDetails,
      required this.totalAmount,
      required this.orderStatus});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        onTap: () {
          print("OrderDetails Inside Order Item Build:::");
          print("$orderID, $orderID,$orderDetails, $totalAmount, $date");
          Navigator.of(context).pushNamed('/orderSummaryScreen', arguments: {
            'orderID': orderID,
            'date': date,
            'address': address,
            'totalAmount': totalAmount,
            'orderDetails': orderDetails,
            'orderStatus': orderStatus
          });
        },
        leading: CircleAvatar(
          radius: 22,
          backgroundColor: Colors.grey[200],
          child: ClipOval(
            child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/your-basket-515fc.appspot.com/o/Your%20Order%2FList%20Tile%20Icon%2Forder.png?alt=media&token=feaf31d9-cf28-4629-abc1-c89ebb9b3293',
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text('Order Id: ${orderID.toUpperCase()}'),
        subtitle: Container(
          margin: const EdgeInsets.only(top: 3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Price: ₹${totalAmount}',
                style: TextStyle(fontSize: 11),
              ),
              Text(
                DateFormat.yMMMd().format(date),
                style: TextStyle(fontSize: 11),
              ),
            ],
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.navigate_next),
          ],
        ),
        tileColor: Colors.white,
        minVerticalPadding: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
