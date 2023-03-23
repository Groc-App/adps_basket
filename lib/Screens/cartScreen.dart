// ignore: file_names
// ignore: file_names
// ignore_for_file: implementation_imports, file_names, duplicate_ignore

import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
  double discount = 0;
  TextEditingController couponController = TextEditingController();
  bool _isLoading = false;
  double deliveryCharges = 0;

  void updatediscount(value) {
    setState(() {
      discount = value;
    });
  }

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

    return list != null
        ? Column(
            children: [
              Column(
                children: list.map((data) {
                  pricetotal = pricetotal + (data.ItemCount * data.Item.Price);
                  if (pricetotal <= 50)
                    deliveryCharges = 19.0;
                  else if (pricetotal <= 100)
                    deliveryCharges = 9.0;
                  else
                    deliveryCharges = 0.0;
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
                // TextSpan(
                //   text: '₹40',
                //   style: TextStyle(
                //       fontSize: 15,
                //       fontWeight: FontWeight.w600,
                //       color: Colors.grey,
                //       decoration: TextDecoration.lineThrough),
                // ),
                TextSpan(
                  text: '₹$deliveryCharges',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ]),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Discount: ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Text(
              "₹${discount}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            )
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
              "₹${(pricetotal - discount + deliveryCharges)}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scWidth = scSize.width;
    final scHeight = scSize.height;

    var authInfo = ref.watch(authCheckProvider);

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
                    // _cartList(ref, scHeight, scWidth, '+917982733943'),
                  ),
                ),

                discount == 0.0
                    ? Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: couponController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter coupon code',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                print(couponController.text);
                                FocusScope.of(context).unfocus();

                                setState(() {
                                  _isLoading = true;
                                });

                                var status = await ref.read(
                                    checkcouponprovider({
                                  'number': authInfo.phoneNumber ?? '',
                                  'code': couponController.text
                                }).future);

                                if (status == 'Invalid') {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Invalid code')));
                                } else if (status == 'Redeemed') {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text('Already Redeemed')));
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                  setState(() {
                                    discount = double.parse(status);
                                  });
                                }

                                setState(() {
                                  _isLoading = false;
                                });
                              },
                              child: _isLoading == false
                                  ? Text('Apply Coupon')
                                  : SpinKitThreeInOut(
                                      color: Colors.green,
                                      size: 28,
                                    ),
                            )
                          ],
                        ),
                      )
                    : Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            CachedNetworkImage(
                              imageUrl:
                                  'https://firebasestorage.googleapis.com/v0/b/your-basket-515fc.appspot.com/o/Icons%2Fbottomnavbar%2Foffer-icon-2.png?alt=media&token=ebadf132-5585-4527-8511-c7790ff1ab88',
                              height: 27,
                              color: Colors.green,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text('Yayy, Coupon applied'),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  discount = 0.0;
                                });
                              },
                              child: Text(
                                'Change Coupon',
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 12),
                              ),
                            )
                          ],
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
                              'tamount': pricetotal,
                              'discount': discount,
                              'deliveryCharges': deliveryCharges
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
