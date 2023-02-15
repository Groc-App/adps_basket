// ignore: file_names
// ignore: file_names
// ignore_for_file: implementation_imports, file_names, duplicate_ignore

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_basket/Widgets/Cart/Noitems.dart';
import 'package:your_basket/Widgets/Homepage/ProductItem.dart';
import 'package:your_basket/application/state/cart_state.dart';
import '../Widgets/Cart/CartItem.dart' as CartItemWidget;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/providers.dart';
import '../models/cart/cartitem.dart' as CartItemModel;

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  // CartScreen({super.key});

  double pricetotal = 0.0;
  bool emptylist = false;
  int listsize = 0;
  var datalist;

  // Widget cartitemList(String? userid) {
  //   print('Rebild CartItem');

  //   final categories = ref.watch(cartItemProvider(userid));

  //   return categories.when(
  //     data: (list) {
  //       print('\nlist is::::::::::::::::\n$list');
  //       if (list != null) {
  //         pricetotal = 0.0;
  //         listsize = list.length;
  //         if (listsize == 0) emptylist = true;
  //         datalist = list;
  //         for (int i = 0; i < list.length; i++) {
  //           pricetotal += list[i].ItemCount * list[i].Item.Price;
  //         }
  //       } else {
  //         emptylist = true;
  //         print('list null hai');
  //       }
  //       return buildCartItems(list, userid);
  //     },
  //     error: (_, __) => const Center(child: Text("ERR")),
  //     loading: () => const Center(child: CircularProgressIndicator()),
  //   );
  // }

  Widget _cartList(WidgetRef ref) {
    final cartState = ref.watch(cartItemsProvider);

    if (cartState.cartModel == null) {
      return const LinearProgressIndicator();
    }

    if (cartState.cartModel!.products.isEmpty) {
      return NoItems(
        noitemtext: 'Your Cart is Empty!!!!',
      );
    }

    return _buildCartItems(
        cartState.cartModel!.products.cast<CartItemModel.CartItem>(),
        '+917982733943');
  }

  Widget _buildCartItems(List<CartItemModel.CartItem>? list, String? userid) {
    datalist = list;
    return list != null
        ? Column(
            children: list.map((data) {
              return CartItemWidget.CartItem(
                quantity: (data.ItemCount == null ? 0 : data.ItemCount),
                item: data.Item,
                userid: userid ?? '',
              );
            }).toList(),
          )
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scWidth = scSize.width;
    final scHeight = scSize.height;

    print("Rebild");
    // ref.watch(CartItemWidget.counterProvider);
    final data = ref.watch(ProductItemcounterProvider);
    print("This is data $data");

    // var authInfo = ref.watch(authCheckProvider);
    // print(authInfo?.uid);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 230, 230),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'Your Cart',
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            if (listsize != 0)
              Text(
                '${listsize} items',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w100),
              )
          ],
        ),
      ),
      body:
          // authInfo == null
          //     ? NoItems(
          //         noitemtext: 'Login/Signup first',
          //         pageroute: 'loginpage',
          //       )
          //     :
          Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // cartitemList(ref, authInfo.phoneNumber),
                  // cartitemList('+917982733943'),
                  _cartList(ref),
                  emptylist == false
                      ? Container(
                          margin: const EdgeInsets.only(top: 20, bottom: 20),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 9),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Items Price: ',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "₹${pricetotal}",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      'Delivery Charges: ',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      'Free',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                                const Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Grand Total",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "₹${pricetotal}",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                )
                              ]),
                        )
                      : NoItems(
                          noitemtext: 'Your Cart is Empty!!!!',
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

          if (emptylist == false)
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  print("Total AMount $pricetotal");
                  var cartProductsArray = [];
                  // print("\n\nProduct list ${datalist}");
                  for (var i = 0; i < datalist.length; i++) {
                    var cartItem = datalist[i];

                    var map = {
                      'Product': cartItem.Item.productId,
                      'Quantity': cartItem.ItemCount
                    };
                    cartProductsArray.add(map);

                    print("\nCartItemId:: ${cartItem.Item.productId}");
                    print("\nCartItemCount:: ${cartItem.ItemCount}");
                  }

                  print("\nCart Products Array:: ${cartProductsArray}");

                  var map = {
                    'totalAmnt': pricetotal,
                    'productlist': cartProductsArray
                  };

                  print("\nCart Products Map:: ${map}");

                  var data = ref.watch(placeorderProvider(map));
                  print("\nData reviecds ${data}");
                  data.when(data: (msg) {
                    print("\n\nInside Data reviecds");

                    Navigator.of(context).pushNamed('/ordersuccessScreen');
                  }, error: (_, __) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Order Failed')),
                    );
                  }, loading: () {
                    CircularProgressIndicator();
                  });
                  print("\nData reviecds ${data}");
                },
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
