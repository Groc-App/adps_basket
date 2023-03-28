// ignore: file_names
// ignore: file_names
// ignore_for_file: implementation_imports, file_names, duplicate_ignore, library_prefixes, library_private_types_in_public_api, use_build_context_synchronously

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:your_basket/Widgets/Cart/Noitems.dart';
import 'package:your_basket/Widgets/Sinners/CartItemSinner.dart';
import '../Widgets/Cart/CartItem.dart' as CartItemWidget;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/providers.dart';
import '../models/cart/cartitem.dart' as CartItemModel;

String userNumber = '';

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
  String referralVeri = "false";
  String couponCode = '';
  bool _showCoupon = false;

  @override
  void initState() {
    super.initState();

    getNumber();
    setStatus(userNumber);
  }

  Future<void> setStatus(String userNumber) async {
    print(userNumber);
    var status = await ref.read(verifyCouponProvider(userNumber).future);

    if (status == 'true') {
      updateRefVeri('true');
      updatediscount(10.0);
    } else {
      updateRefVeri('false');
      updatediscount(0.0);
    }
  }

  void updatediscount(value) {
    setState(() {
      discount = value;
    });
  }

  void updateRefVeri(value) {
    setState(() {
      referralVeri = value;
    });
  }

  void setCouponCode(value) {
    setState(() {
      couponCode = value;
    });
  }

  Widget _cartList(WidgetRef ref, scHeight, scWidth) {
    final cartState = ref.watch(cartItemsProvider(userNumber));

    if (cartState.cartModel == null) {
      return const CartItemSinner();
    }

    if (cartState.cartModel!.products.isEmpty) {
      iscartempty = true;
      return const NoItems(
        noitemtext: 'Your Cart is Empty!!!!',
      );
    }

    return _buildCartItems(
        cartState.cartModel!.products.cast<CartItemModel.CartItem>(),
        userNumber,
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
                  if (pricetotal <= 50) {
                    deliveryCharges = 19.0;
                  } else if (pricetotal <= 100) {
                    deliveryCharges = 9.0;
                  } else {
                    deliveryCharges = 0.0;
                  }
                  return CartItemWidget.CartItem(
                      quantity: (data.ItemCount),
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
          boxShadow: const [BoxShadow(blurRadius: 1, spreadRadius: 0)],
          borderRadius: BorderRadius.circular(5),
          color: Colors.white),
      width: scWidth * 0.85,
      // height: min(scHeight * 0.3, 145),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Items Price: ',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  "₹$pricetotal",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                )
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Delivery Charges: ',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text.rich(
                  TextSpan(children: [
                    if (deliveryCharges < 19.0)
                      const TextSpan(
                        text: '₹19',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough),
                      ),
                    TextSpan(
                      text: '  ₹$deliveryCharges',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ]),
                ),
              ],
            ),
            const SizedBox(height: 5),
            if (discount > 0.0)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Discount: ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor),
                  ),
                  Text(
                    "-₹$discount",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor),
                  )
                ],
              ),
            if (discount > 0.0) const SizedBox(height: 5),
            if (pricetotal < 100)
              Text(
                pricetotal < 50
                    ? 'You are ₹${50 - pricetotal} away to reduce delivery charges'
                    : 'You are ₹${100 - pricetotal} away to get free delivery',
                style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 169, 165, 165)),
              ),
            const SizedBox(
              height: 5,
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Grand Total",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Text(
                  "₹${(pricetotal - discount + deliveryCharges)}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ]),
    );
  }

  Widget douyouhavecoupon() {
    return discount > 0.0
        ? Container(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
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
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text('Yayy, referral discount applied'),
              ],
            ),
          )
        : Container(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
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
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text('Do you have a coupon?'),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _showCoupon = true;
                    });
                  },
                  child: const Text(
                    'Apply Coupon',
                    style: TextStyle(color: Colors.blue, fontSize: 12),
                  ),
                )
              ],
            ),
          );
  }

  Future<void> getNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userNumberr = prefs.getString('username') ?? '';
    setState(() {
      userNumber = userNumberr;
    });
  }

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scWidth = scSize.width;
    final scHeight = scSize.height;

    // var authInfo?=username

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: BackButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/cartScreen');
          },
        ),
        centerTitle: true,
        title: Column(
          children: [
            const Text(
              'Your Cart',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            if (listsize != 0)
              Text(
                '$listsize items',
                style:
                    const TextStyle(fontSize: 10, fontWeight: FontWeight.w100),
              )
          ],
        ),
      ),
      body: userNumber == ''
          ? const NoItems(
              noitemtext: 'Login/SignUp First',
              pageroute: 'loginpage',
            )
          : Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                children: [
                  Expanded(
                    // Expanded kr lio
                    child: SingleChildScrollView(
                      child: _cartList(ref, scHeight, scWidth),
                    ),
                  ),

                  if (iscartempty == false)
                    _showCoupon == false
                        ? douyouhavecoupon()
                        : (discount == 0.0)
                            ? Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 7),
                                child: Column(
                                  children: [
                                    TextFormField(
                                      controller: couponController,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Enter coupon code',
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: ((scWidth * 0.5) - 80)),
                                          child: ElevatedButton(
                                            onPressed: () async {
                                              FocusScope.of(context).unfocus();

                                              setCouponCode(
                                                  couponController.text);

                                              setState(() {
                                                _isLoading = true;
                                              });

                                              var status = await ref.read(
                                                  checkcouponprovider({
                                                'number': userNumber,
                                                'code': couponController.text
                                              }).future);

                                              if (status == 'Invalid') {
                                                ScaffoldMessenger.of(context)
                                                    .hideCurrentSnackBar();
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(const SnackBar(
                                                        content: Text(
                                                            'Invalid code')));
                                              } else if (status == 'Redeemed') {
                                                ScaffoldMessenger.of(context)
                                                    .hideCurrentSnackBar();
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(const SnackBar(
                                                        content: Text(
                                                            'Already Redeemed')));
                                              } else if (status == 'Sortage') {
                                                ScaffoldMessenger.of(context)
                                                    .hideCurrentSnackBar();
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(const SnackBar(
                                                        content: Text(
                                                            'No referral left')));
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .hideCurrentSnackBar();
                                                setState(() {
                                                  discount =
                                                      double.parse(status);
                                                });
                                              }

                                              setState(() {
                                                _isLoading = false;
                                              });
                                            },
                                            child: _isLoading == false
                                                ? const Text('Apply Coupon')
                                                : SpinKitThreeInOut(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    size: 28,
                                                  ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Spacer(),
                                        GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _showCoupon = false;
                                              });
                                            },
                                            child: const Icon(
                                                Icons.cancel_rounded)),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            : Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 3),
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
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Text('Yayy, Coupon applied'),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          discount = 0.0;
                                        });
                                      },
                                      child: const Text(
                                        'Change Coupon',
                                        style: TextStyle(
                                            color: Colors.blue, fontSize: 12),
                                      ),
                                    )
                                  ],
                                ),
                              ),

                  // ----------         Button to checkout     --------

                  if (iscartempty == false)
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/checkoutScreen',
                            arguments: {
                              'number': userNumber,
                              'cartProductList': datalist,
                              'tamount': pricetotal,
                              'discount': discount,
                              'deliveryCharges': deliveryCharges,
                              'couponCode': couponCode
                            });
                      },
                      child: Container(
                        width: scWidth,
                        height: scHeight * 0.08,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8)),
                            color: Theme.of(context).primaryColor),
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
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    color: Color.fromARGB(255, 74, 74, 74),
                                    offset: Offset(1, 1),
                                    blurRadius: 1,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                ],
              ),
            ),
    );
  }
}
