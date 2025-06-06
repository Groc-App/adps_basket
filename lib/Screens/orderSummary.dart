// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:your_basket/models/address/address.dart';

class OrderSummaryScreen extends StatelessWidget {
  OrderSummaryScreen({super.key});

  late String orderID;
  late String totalAmount;
  late DateTime date;
  late Address address;
  late String orderStatus;

  late List<Map<String, dynamic>> orderDetails;

  @override
  Widget build(BuildContext context) {
    var orderData = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    orderID = orderData['orderID'];
    totalAmount = orderData['totalAmount'];
    date = orderData['date'];
    orderStatus = orderData['orderStatus'];
    orderDetails = orderData['orderDetails'];
    address = orderData['address'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Order Summary'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /* ------------------------- Order Summary Container ------------------------ */
              /* -------------------------------------------------------------------------- */
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(blurRadius: 1, spreadRadius: 0)
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.white),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Order Summary",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Arrived on ${DateFormat.yMMMd().format(date)} in just 15 minutes!",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w100),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.symmetric(vertical: 8),
                      child: Text(
                        "${orderDetails.length} items in this order",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w800),
                      ),
                    ),

                    /* --------------------------- List tile for item --------------------------- */
                    Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (context, i) {
                            int price = orderDetails[i]['Product']['Price'] *
                                orderDetails[i]['Quantity'];

                            return ListTile(
                              leading: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                child: Image.network(
                                    orderDetails[i]['Product']['ImageUrl'][0]),
                              ),
                              title: Text(orderDetails[i]['Product']['Name']),
                              subtitle: Text(
                                  "${orderDetails[i]['Product']['Quantity'].toString()} X ${orderDetails[i]['Quantity'].toString()}"),
                              trailing: Text(
                                "₹${price.toString()}",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            );
                          },
                          itemCount: orderDetails.length,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              /* ----------------------------- Upper container ---------------------------- */
              SizedBox(height: 20),
              /* ----------------------- Container For Bill Details ----------------------- */
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(blurRadius: 1, spreadRadius: 0)
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.white),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bill Details",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("MRP"),
                        Text("₹$totalAmount"),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Delivery Charges"),
                        Text("₹0"),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Bill Total",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "₹$totalAmount",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),

              /* ----------------------- Container For Order Details ---------------------- */
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(blurRadius: 1, spreadRadius: 0)
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.white),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order Details",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    Divider(
                      thickness: 1,
                      color: Color.fromARGB(255, 241, 237, 237),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Order id",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Color.fromARGB(255, 137, 137, 137)),
                        ),
                        Text("$orderID"),
                      ],
                    ),
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Payment",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Color.fromARGB(255, 137, 137, 137)),
                        ),
                        Text("Paid Online"),
                      ],
                    ),
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Deliver to",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Color.fromARGB(255, 137, 137, 137)),
                        ),
                        Text(
                            "${address.Recipients_Name}, ${address.Flat_FLoor_Tower} ${address.Street_Society} ${address.City} ${address.Pincode} "),
                      ],
                    ),
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Order placed",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Color.fromARGB(255, 137, 137, 137)),
                        ),
                        Text(
                            "Placed on ${DateFormat('yyyy-MM-dd').format(date)} at ${DateFormat('hh:mm:ss').format(date)}"),
                      ],
                    ),
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Order Status",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Color.fromARGB(255, 137, 137, 137)),
                        ),
                        Text(
                          orderStatus,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: orderStatus == 'Ordered'
                                  ? Color.fromARGB(255, 127, 118, 39)
                                  : orderStatus == 'Delivered'
                                      ? Theme.of(context).primaryColor
                                      : Colors.red),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
