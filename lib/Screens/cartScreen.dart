import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:slide_to_act/slide_to_act.dart';
import '../Widgets/Cart/CartItem.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final cartItemList = [
    {'idx': '1'},
    {'idx': '1'},
    {'idx': '1'},
  ];

  @override
  Widget build(BuildContext context) {
    final sc_size = MediaQuery.of(context).size;
    final sc_width = sc_size.width;
    final sc_height = sc_size.height;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 230, 230),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Column(
          children: [
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
                      return CartItem();
                    }).toList(),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 9),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(blurRadius: 5, spreadRadius: 0.5)
                        ],
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    width: sc_width * 0.85,
                    height: min(sc_height * 0.2, 125),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
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
                            children: [
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
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
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
              onTap: () {
                print('Ordered');
              },
              child: Container(
                  width: sc_width,
                  height: sc_height * 0.08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                      color: Colors.deepPurple[300]),
                  alignment: Alignment(0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: FaIcon(
                          FontAwesomeIcons.basketShopping,
                          size: 23,
                          color: Colors.white,
                        ),
                      ),
                      Text(
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
