// ignore: file_names
// ignore: file_names
// ignore_for_file: implementation_imports, file_names, duplicate_ignore

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_basket/Widgets/Cart/Noitems.dart';
import 'package:your_basket/Widgets/Homepage/ProductItem.dart';
import 'package:your_basket/Widgets/Sinners/CartItemSinner.dart';
import 'package:your_basket/application/state/cart_state.dart';
import '../Widgets/Cart/CartItem.dart' as CartItemWidget;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/providers.dart';
import '../models/cart/cartitem.dart' as CartItemModel;
import '../models/product/productdetail.dart' as ProductItemModel;

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  // CartScreen({super.key});

  bool iscartempty = false;
  double pricetotal = 0.0;
  int listsize = 0;
  List<CartItemModel.CartItem>? datalist;

  Widget _cartList(WidgetRef ref, scHeight, scWidth, phonenumber) {
    final cartState = ref.watch(cartItemsProvider);

    if (cartState.cartModel == null) {
      return const CartItemSinner();
    }

    if (cartState.cartModel!.products.isEmpty) {
      iscartempty = true;
      return NoItems(
        noitemtext: 'Your Cart is Empty!!!!',
      );
    }

    print('dobara bani hhhhhhhhhhhhhhhhhhh\n');
    print(cartState.cartModel!.products);

    return _buildCartItems(
        cartState.cartModel!.products.cast<CartItemModel.CartItem>(),
        phonenumber,
        scHeight,
        scWidth);
  }

  Widget _buildCartItems(
      List<CartItemModel.CartItem>? list, String? userid, scHeight, scWidth) {
    datalist = list;
    pricetotal = 0.0;
    print('\ninside buildcartitemssssssssssssssssss\n');
    print(list);

    return list != null
        ? Column(
            children: [
              Column(
                children: list.map((data) {
                  pricetotal = pricetotal + (data.ItemCount * data.Item.Price);
                  return CartItemWidget.CartItem(
                      quantity: (data.ItemCount == null ? 0 : data.ItemCount),
                      item: data.Item,
                      userid: userid ?? '');
                }).toList(),
              ),
              _totalprice(scHeight, scWidth),
            ],
          )
        : Container();
  }

  Widget _totalprice(scHeight, scWidth) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      decoration: BoxDecoration(
          boxShadow: const [BoxShadow(blurRadius: 5, spreadRadius: 0.5)],
          borderRadius: BorderRadius.circular(5),
          color: Colors.white),
      width: scWidth * 0.85,
      height: min(scHeight * 0.2, 125),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Items Price: ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Text(
              "₹${pricetotal}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Delivery Charges: ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Text.rich(
              TextSpan(children: [
                TextSpan(
                  text: '₹40',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough),
                ),
                TextSpan(
                  text: ' Free',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ]),
            ),
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Grand Total",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Text(
              "₹${pricetotal}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            )
          ],
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scWidth = scSize.width;
    final scHeight = scSize.height;

    print("Rebild");

    var authInfo = ref.watch(authCheckProvider);
    // print(authInfo?.uid);

    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 237, 230, 230),
      appBar: AppBar(
        // backgroundColor: Tsheme.of(context).primaryColor,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'Your Cart',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            if (listsize != 0)
              Text(
                '${listsize} items',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w100),
              )
          ],
        ),
      ),
      body: authInfo == null
          ? NoItems(
              noitemtext: 'Login/Signup first',
              pageroute: 'loginpage',
            )
          : Column(
              children: [
                Expanded(
                  // Expanded kr lio
                  child: SingleChildScrollView(
                    child:
                        _cartList(ref, scHeight, scWidth, authInfo.phoneNumber),
                  ),
                ),

                // ----------         Button to checkout     --------

                if (iscartempty == false)
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/checkoutScreen',
                            arguments: {
                              'number': authInfo.phoneNumber ?? '',
                              'cartProductList': datalist,
                              'tamount': pricetotal
                            });
                      },
                      child: Container(
                          width: scWidth,
                          height: scHeight * 0.08,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8)),
                              color: Color.fromRGBO(83, 177, 117, 1)),
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
                                'Proceed to Checkout',
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
