// ignore: file_names
// ignore: file_names
// ignore_for_file: implementation_imports, file_names, duplicate_ignore

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Widgets/Cart/CartItem.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final cartItemList = [
    {'idx': '1'},
    {'idx': '1'},
  ];

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scWidth = scSize.width;
    final scHeight = scSize.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 230, 230),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Column(
          children: const [
            Text(
              'Your Cart',
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            Text(
              '3 items',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w100),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: cartItemList.map((e) {
                      return const CartItem();
                    }).toList(),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 20),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(blurRadius: 5, spreadRadius: 0.5)
                        ],
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    width: scWidth * 0.85,
                    height: min(scHeight * 0.2, 125),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Items Price: ',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '500\$',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Delivery Charges: ',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'Free',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Grand Total: ',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '500\$',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              )
                            ],
                          )
                        ]),
                  )
                ],
              ),
            ),
          ),

//        ------               Slide to pay           ------

          // Container(
          //   width: sc_width,
          //   height: sc_height * 0.08,
          //   // color: Colors.black,
          //   child: SlideAction(
          //     onSubmit: () {},
          //     height: sc_height * 0.08,
          //     text: 'Slide to Checkout',
          //     innerColor: Colors.deepPurple,
          //     outerColor: Colors.deepPurple[300],
          //     sliderButtonIcon: FaIcon(
          //       FontAwesomeIcons.basketShopping,
          //       // size: 20,
          //       color: Colors.white,
          //     ),
          //     sliderButtonIconSize: 23,
          //     sliderButtonIconPadding: 8,
          //     borderRadius: 10,
          //     sliderButtonYOffset: -4,
          // textStyle: TextStyle(
          //     fontSize: 18,
          //     fontWeight: FontWeight.bold,
          //     color: Colors.white),
          //   ),
          // )

          // ----------         Button to checkout     --------

          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                  width: scWidth,
                  height: scHeight * 0.08,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                      color: Colors.deepPurple[300]),
                  alignment: const Alignment(0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: const FaIcon(
                          FontAwesomeIcons.basketShopping,
                          size: 23,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        'Slide to Checkout',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}
