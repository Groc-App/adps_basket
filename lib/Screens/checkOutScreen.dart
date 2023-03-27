// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace, file_names, non_constant_identifier_names, use_build_context_synchronously, unnecessary_string_interpolations, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:your_basket/config.dart';
import 'package:your_basket/models/address/address.dart';
import 'package:your_basket/models/cart/cartitem.dart';

import '../providers/providers.dart';

class CheckoutScreen extends StatelessWidget {
  // const CheckoutScreen({super.key});
  final scWidth = Config.scSize.width;
  final scHeight = Config.scSize.height;

  CheckoutScreen({super.key});

  Widget placeordertile(
      WidgetRef ref,
      String number,
      BuildContext context,
      List<CartItem> datalist,
      pricetotal,
      discount,
      deliveryCharges,
      String? couponCode) {
    final AddressBookState = ref.watch(addressBokkProvider(number));
    var reqData = Address(
        addressId: '',
        defaultAddress: false,
        Flat_FLoor_Tower: '',
        Street_Society: '',
        Recipients_Name: '',
        City: '',
        Pincode: '');

    if (AddressBookState.isLoading) {
      return SpinKitThreeInOut();
    }

    if (AddressBookState.AddressBookModel!.addresses.isNotEmpty) {
      reqData = AddressBookState.AddressBookModel!.addresses
          .firstWhere((e) => e.defaultAddress == true);
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        adresstile(context, reqData),
        ordertile(datalist, ref, pricetotal, context, number, reqData, discount,
            deliveryCharges, couponCode),
      ],
    );
  }

  Widget adresstile(context, Address value) {
    if (value.addressId == '') {
      return ListTile(
        leading: Icon(Icons.delivery_dining),
        title: Text(
          "Delivering to home",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('Add Address'),
        trailing: GestureDetector(
            onTap: () => Navigator.of(context).pushNamed('/addressScreen'),
            child: Text("Add")),
      );
    } else {
      return ListTile(
        leading: Icon(Icons.delivery_dining),
        title: Text(
          "Delivering to home",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('${value.Flat_FLoor_Tower} ${value.Street_Society}'),
        trailing: GestureDetector(
            onTap: () => Navigator.of(context).pushNamed('/addressScreen'),
            child: Text(
              "Change",
              style: TextStyle(color: Colors.blue),
            )),
      );
    }
  }

  Widget ordertile(
      List<CartItem> datalist,
      WidgetRef ref,
      double pricetotal,
      BuildContext context,
      String number,
      Address value,
      discount,
      deliveryCharges,
      String? couponCode) {
    return Container(
      height: Config.scHeight * 0.07,
      // decoration: const BoxDecoration(
      //   boxShadow: [
      //     BoxShadow(
      //       blurRadius: 2.0,
      //     ),
      //   ],
      // ),
      // margin: EdgeInsets.only(bottom: 20),
      // padding: EdgeInsets.only(bottom: 20),
      width: double.infinity,
      child: GestureDetector(
        onTap: () async {
          var cartProductsArray = [];
          for (var i = 0; i < datalist.length; i++) {
            var cartItem = datalist[i];

            var map = {
              'Product': cartItem.Item.productId,
              'Quantity': cartItem.ItemCount
            };
            cartProductsArray.add(map);
          }

          var addressid = value.addressId;

          if (addressid == '') {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Address Alert'),
                content: Text('Please add address first.'),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('OK'))
                ],
              ),
            );
          } else {
            final cartViewModel = ref.read(cartItemsProvider(number).notifier);
            String succesdata = await cartViewModel.placeOrder(
                number,
                (pricetotal - discount + deliveryCharges).toString(),
                cartProductsArray,
                addressid,
                couponCode);

            if (succesdata == 'Success') {
              Navigator.of(context).pushNamed('/ordersuccessScreen',
                  arguments: {'type': 'order'});
            } else {
              Navigator.of(context).pushNamed('/orderfailureScreen',
                  arguments: {'type': 'order'});
            }
          }
        },
        child: Container(
          width: scWidth,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              color: Theme.of(context).primaryColor),
          alignment: const Alignment(0, 0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              // Container(
              //   margin: const EdgeInsets.only(right: 10),
              //   child: const FaIcon(
              //     FontAwesomeIcons.basketShopping,
              //     size: 23,
              //     color: Colors.white,
              //   ),
              // ),
              Text(
                'Place Order',
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
      ),

      // ElevatedButton(
      //     style: ElevatedButton.styleFrom(
      //         elevation: 40, backgroundColor: Theme.of(context).primaryColor),
      //     onPressed: () async {
      //       var cartProductsArray = [];
      //       for (var i = 0; i < datalist.length; i++) {
      //         var cartItem = datalist[i];

      //         var map = {
      //           'Product': cartItem.Item.productId,
      //           'Quantity': cartItem.ItemCount
      //         };
      //         cartProductsArray.add(map);
      //       }

      //       var addressid = value.addressId;

      //       if (addressid == '') {
      //         print('hitted');
      //         showDialog(
      //           context: context,
      //           builder: (context) => AlertDialog(
      //             title: Text('Address Alert'),
      //             content: Text('Please add address first.'),
      //             actions: [
      //               TextButton(
      //                   onPressed: () => Navigator.of(context).pop(),
      //                   child: Text('OK'))
      //             ],
      //           ),
      //         );
      //       } else {
      //         final cartViewModel = ref.read(cartItemsProvider.notifier);
      //         String succesdata = await cartViewModel.placeOrder(
      //             number,
      //             (pricetotal - discount + deliveryCharges).toString(),
      //             cartProductsArray,
      //             addressid,
      //             couponCode);

      //         if (succesdata == 'Success') {
      //           Navigator.of(context).pushNamed('/ordersuccessScreen',
      //               arguments: {'type': 'order'});
      //         } else {
      //           Navigator.of(context).pushNamed('/orderfailureScreen',
      //               arguments: {'type': 'order'});
      //         }
      //       }
      //     },
      //     child: Text("Place Order")),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    // final scHeight = scSize.height;
    final scWidth = scSize.width - 10 - 4 - 8;

    // var authInfo = ref.watch(authCheckProvider);

    var Orderdata = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    String number = Orderdata['number'];
    List<CartItem> datalist = Orderdata['cartProductList'];
    double pricetotal = Orderdata['tamount'];
    double discount = Orderdata['discount'];
    double deliveryCharges = Orderdata['deliveryCharges'];
    String? couponCode = Orderdata['couponCode'];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.green[400],
        title: Text(
          "Checkout",
          style: TextStyle(color: Colors.white),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Container(
          height: 160, //set your height here
          width: double.maxFinite, //set your width here
          decoration: BoxDecoration(
            // color: Theme.of(context).scaffoldBackgroundColor,
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),
          ),
          child: Container(
              // padding: EdgeInsets.symmetric(horizontal: 10),
              child: Consumer(
            builder: (context, ref, child) => placeordertile(
                ref,
                number,
                context,
                datalist,
                pricetotal,
                discount,
                deliveryCharges,
                couponCode),
          )),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              elevation: 4,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(blurRadius: 1, spreadRadius: 0)
                    ],
                    // border: Border.all(),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.white),
                width: scWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            "Your Orders",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // decoration: BoxDecoration(border: Border.all()),
                      margin: EdgeInsetsDirectional.symmetric(vertical: 8),
                      child: Text(
                        "${datalist.length} items in this order",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w800),
                      ),
                    ),

                    /* --------------------------- List tile for item --------------------------- */

                    ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.all(
                                Radius.circular(10.0)), //add border radius here
                            child: Image.network(datalist[index]
                                .Item
                                .ImageUrl[0]), //add image location here
                          ),
                          title: Text("${datalist[index].Item.Name}"),
                          subtitle: Text(
                              "${datalist[index].Item.Quantity} X ${datalist[index].ItemCount}"),
                          trailing: Text(
                            "₹${datalist[index].Item.Price * datalist[index].ItemCount}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        );
                      },
                      itemCount: datalist.length,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  boxShadow: const [BoxShadow(blurRadius: 1, spreadRadius: 0)],
                  // border: Border.all(),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  color: Colors.white),
              width: scWidth,
              child: Column(
                // mainAxisAlignment: MainA,
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    "Bill Details",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text("MRP"),
                      Text("₹${pricetotal}"),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Delivery Charges"),
                      RichText(
                        text: TextSpan(
                          text: 'This item costs ',
                          children: <TextSpan>[
                            // TextSpan(
                            //   text: '',
                            //   style: TextStyle(
                            //     color: Colors.grey,
                            //     decoration: TextDecoration.lineThrough,
                            //   ),
                            // ),
                            TextSpan(
                              text: '₹${deliveryCharges}',
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Discount: ',
                      ),
                      Text(
                        "₹${discount}",
                      )
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        "Bill Total",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "₹${pricetotal - discount + deliveryCharges}",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  boxShadow: const [BoxShadow(blurRadius: 1, spreadRadius: 0)],
                  // border: Border.all(),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  color: Colors.white),
              width: scWidth,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Payment Method',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(children: [
                        Container(
                          width: 25,
                          height: 25,
                          margin: EdgeInsets.only(right: 10),
                          alignment: Alignment(0, 0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).primaryColor),
                          child: Icon(
                            Icons.done,
                            size: 23,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'COD',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text('You can also do UPI at the time delivery'),
                          ],
                        ),
                      ]),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(children: [
                        Container(
                          width: 25,
                          height: 25,
                          margin: EdgeInsets.only(right: 10),
                          alignment: Alignment(0, 0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          child: Icon(
                            Icons.cancel,
                            size: 23,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mobile Wallets/UPI',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            SizedBox(
                              width: scWidth * 0.8,
                              child: Text(
                                'You can do online Payment at the time of delivery',
                                // style: TextStyle(fontSize: 24),
                                softWrap: true,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            // Text(
                            //     // softWrap: true,
                            //     // overflow: TextOverflow.ellipsis,
                            //     ''),
                          ],
                        ),
                      ]),
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
