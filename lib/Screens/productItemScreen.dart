// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:your_basket/Screens/buySubscriptionScreen.dart';
import 'package:your_basket/Widgets/Categories/addItemIcon.dart';
import 'package:readmore/readmore.dart';
import 'package:your_basket/models/product/productdetail.dart';
import 'package:your_basket/models/product/products.dart';
import 'package:your_basket/providers/providers.dart';
import 'package:share_plus/share_plus.dart';

class ProductItemScreen extends ConsumerStatefulWidget {
  const ProductItemScreen({super.key});

  @override
  ConsumerState<ProductItemScreen> createState() => _ProductItemScreenState();
}

class _ProductItemScreenState extends ConsumerState<ProductItemScreen> {
  // ProductItemScreen({super.key});

  late Product product;
  int counter = 0;

  Widget buildProduct(BuildContext context, double scWidth) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(
            (15),
          ),
          height: MediaQuery.of(context).size.height * 0.3,
          width: double.infinity,
          alignment: Alignment.topLeft,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://bonn.in/wp-content/uploads/2019/10/brown-dummy-with-sandwich-only.png'))),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.53,
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.all((15)),
          // ignore: prefer_const_constructors
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(color: Colors.grey, blurRadius: 2, spreadRadius: 2)
            ],
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 15,
              ),
              // ignore: prefer_const_literals_to_create_immutables
              child: Row(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: scWidth * 0.8,
                      child: FittedBox(
                        child: Text(
                          product.Name,
                          softWrap: false,
                          maxLines: 1,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Text(product.Quantity)
                  ],
                ),
                const Spacer(),
                IconButton(
                    icon: Icon(Icons.share),
                    onPressed: () {
                      Share.share(
                          'https://play.google.com/store/apps/details?id=com.instructivetech.kidskite');
                    })
                // const Icon(Icons.share),
              ]),
            ),
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  "Rs ${product.Price}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const Spacer(),
                addTile(scWidth),
              ],
            ),
            const Divider(
              // height: 10,
              thickness: 0.8,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 9),
                    child: Text(
                      "Product Details",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  const Text(
                    "Description",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  ReadMoreText(
                    trimLength: 100,
                    trimLines: 3,
                    colorClickableText: Colors.pink,
                    trimMode: TrimMode.Line,
                    moreStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                    lessStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                    trimCollapsedText: '\nShow more >>',
                    trimExpandedText: '\nShow less <<',
                    '${product.Description}',
                  ),
                ],
              ),
            )
          ]),
        )
      ],
    );
  }

  void incrementHandler() {
    setState(() {
      counter++;
    });

    final cartViewModel = ref.read(cartItemsProvider.notifier);
    cartViewModel.updateCartItem(
        '+917982733943', counter.toString(), product.productId);
  }

  void decrementHandler() {
    if ((counter - 1) == 0) {
      final cartViewModel = ref.read(cartItemsProvider.notifier);
      cartViewModel
          .removeCartItems('+917982733943', product.productId)
          .whenComplete(() {
        setState(() {
          counter--;
        });
      });
    } else {
      final cartViewModel = ref.read(cartItemsProvider.notifier);
      cartViewModel
          .updateCartItem(
              '+917982733943', (counter - 1).toString(), product.productId)
          .whenComplete(() {
        setState(() {
          counter--;
        });
      });
    }
  }

  Widget addTile(scWidth) {
    final CartItemModel = ref.watch(cartItemsProvider);
    if (CartItemModel.isLoading) {
      // return CircularProgressIndicator();
      return SpinKitThreeInOut(
        size: 38,
        color: Colors.green,
      );
    }

    var searchdata = CartItemModel.cartModel!.products;
    bool flag = false;
    for (int i = 0; i < searchdata.length; i++) {
      var data = searchdata[i];
      if (product.productId == data.Item.productId) {
        setState(() {
          counter = data.ItemCount;
        });
        flag = true;
        break;
      }
    }
    if (flag == false) {
      setState(() {
        counter = 0;
      });
    }
    print('counter is:::::::::::::: $counter\n');
    return buildAddTile(scWidth);
  }

  Widget buildAddTile(scWidth) {
    return counter != 0
        ? Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(245, 245, 245, 1),
                // border: const Border(
                //     top: BorderSide(width: 2),
                //     bottom: BorderSide(width: 2),
                //     left: BorderSide(width: 2),
                //     right: BorderSide(width: 2)),
                borderRadius: BorderRadius.circular(5)),
            width: scWidth * 0.25,
            height: scWidth * 0.25 * 0.4,
            child: Row(children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => decrementHandler(),
                  child: Icon(
                    // Color(value),
                    color: Color.fromRGBO(83, 177, 117, 1),

                    Icons.remove,
                    size: scWidth * 0.25 * 0.3,
                  ),
                ),
              ),
              SizedBox(
                  width: scWidth * 0.25 * 0.3,
                  child: Text(
                    '${counter}',
                    textAlign: TextAlign.center,
                  )),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => incrementHandler(),
                  child: Icon(
                    color: Color.fromRGBO(83, 177, 117, 1),
                    Icons.add,
                    size: scWidth * 0.25 * 0.3,
                  ),
                ),
              ),
            ]),
          )
        // Container(
        //     width: scWidth * 0.48 * 0.40,
        //     height: scWidth * 0.48 * 0.20,
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(5),
        //       color: Colors.white,
        //     ),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
        //       children: [
        //         MouseRegion(
        //           cursor: SystemMouseCursors.click,
        //           child: GestureDetector(
        //             child: Icon(Icons.remove, size: scWidth * 0.48 * 0.5 * 0.2),
        //             onTap: () => decrementHandler(),
        //           ),
        //         ),
        //         Text('$counter'),
        //         MouseRegion(
        //           cursor: SystemMouseCursors.click,
        //           child: GestureDetector(
        //             child: Icon(Icons.add, size: scWidth * 0.48 * 0.5 * 0.2),
        //             onTap: () => incrementHandler(),
        //           ),
        //         ),
        //       ],
        //     ),
        //   )
        : Container(
            width: scWidth * 0.48 * 0.5,
            height: scWidth * 0.25 * 0.4,
            child: OutlinedButton(
                onPressed: () {
                  // if (authInfo == null) {
                  //   showDialog<String>(
                  //     context: context,
                  //     builder: (BuildContext context) =>
                  //         AlertDialog(
                  //       title: const Text('Login First'),
                  //       content: const Text('Login to Continue'),
                  //       actions: <Widget>[
                  //         TextButton(
                  //           onPressed: () =>
                  //               Navigator.pop(context, 'Cancel'),
                  //           child: const Text('Cancel'),
                  //         ),
                  //         TextButton(
                  //           onPressed: () => Navigator.pushNamed(
                  //               context, '/loginScreen'),
                  //           child: const Text('OK'),
                  //         ),
                  //       ],
                  //     ),
                  //   );
                  // } else {
                  setState(() {
                    counter++;
                  });
                  final cartViewModel = ref.read(cartItemsProvider.notifier);
                  cartViewModel.addCartItems(
                      '+917982733943', product.productId);
                }
                // }
                ,
                child: const Text('ADD')),
          );
  }

  @override
  Widget build(BuildContext context) {
    var scSize = MediaQuery.of(context).size;
    double scWidth = scSize.width;

    var productIdMap = (ModalRoute.of(context)?.settings.arguments ??
        <String, String>{}) as Map;
    product = productIdMap['product'];
    // counter = productIdMap['counter'];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 237, 230, 230),
          title: Row(
            children: [
              Expanded(
                child: FittedBox(
                  child: Text(
                    '${product.Name}',
                    style: TextStyle(fontSize: 58),
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(child: buildProduct(context, scWidth)),
        ),
        backgroundColor: const Color.fromARGB(255, 235, 227, 227),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/cartScreen');
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  // textColor: Colors.white,
                  child: const Text('View Cart'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/buySubscriptionScreen',
                        arguments: {
                          'name': product.Name,
                          'image': product.ImageUrl
                        });
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  // textColor: Colors.white,
                  child: const Text('Subscribe'),
                ),
              ],
            ),
          ),
        ));
  }
}
