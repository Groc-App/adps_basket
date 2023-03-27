// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:readmore/readmore.dart';
import 'package:your_basket/Screens/offerScreen.dart';
import 'package:your_basket/models/product/productdetail.dart';
import 'package:your_basket/models/product/products.dart';
import 'package:your_basket/providers/providers.dart';
import 'package:share_plus/share_plus.dart';
import '../config.dart';

class ProductItemScreen extends ConsumerStatefulWidget {
  const ProductItemScreen({super.key});

  @override
  ConsumerState<ProductItemScreen> createState() => _ProductItemScreenState();
}

class _ProductItemScreenState extends ConsumerState<ProductItemScreen> {
  // ProductItemScreen({super.key});

  late Product product;
  int counter = 0;

  void showZommedimage(BuildContext context, String imageurl) {
    showModalBottomSheet(
        constraints: BoxConstraints(minHeight: Config.scHeight),
        isScrollControlled: true,
        context: context,
        enableDrag: false,
        builder: (context) {
          return Container(
            margin: EdgeInsets.only(top: 30),
            child: Stack(children: [
              Container(
                height: Config.scHeight,
                child: InteractiveViewer(
                    maxScale: 5.0,
                    panEnabled: true,
                    child: CachedNetworkImage(
                      imageUrl: imageurl,
                      // progressIndicatorBuilder:
                      //     (context, url, downloadProgress) =>
                      //         CircularProgressIndicator(
                      //             value: downloadProgress.progress),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    )),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Positioned.fill(
                  child: Align(
                    alignment: Alignment(-0.96, -0.96),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      child: Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              )
            ]),
          );
        });
  }

  Widget imageslider() {
    return CarouselSlider.builder(
      itemCount: product.ImageUrl.length,
      slideBuilder: (idx) {
        return GestureDetector(
          onTap: () {
            showZommedimage(context, product.ImageUrl[idx]);
          },
          child: Container(
              width: double.infinity,
              height: double.infinity,
              child: CachedNetworkImage(
                // fit: BoxFit.contain,
                imageUrl: product.ImageUrl[idx],
                // progressIndicatorBuilder: (context, url, downloadProgress) =>
                //     CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => Icon(Icons.error),
              )),
        );
      },
      slideIndicator: CircularSlideIndicator(
          padding: const EdgeInsets.all(2),
          indicatorBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
          currentIndicatorColor: Colors.black.withOpacity(0.8)),
      enableAutoSlider: true,
      unlimitedMode: true,
      scrollDirection: Axis.horizontal,
      autoSliderTransitionTime: const Duration(milliseconds: 500),
      autoSliderTransitionCurve: Curves.ease,
    );
  }

  Widget buildProduct(BuildContext context, double scWidth, String number) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 12),
          height: MediaQuery.of(context).size.height * 0.3,
          width: double.infinity,
          alignment: Alignment.topLeft,
          child: imageslider(),
        ),
        Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height * 0.53,
          ),
          // height: MediaQuery.of(context).size.height * 0.53,
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.all((15)),
          // ignore: prefer_const_constructors
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(207, 203, 203, 1),
                  blurRadius: 2,
                  spreadRadius: 2)
            ],
            // color: Color.fromARGB(255, 250, 246, 246),
            // color: Color.fromRGBO(236, 236, 234, 1),
            color: Theme.of(context).scaffoldBackgroundColor,
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
                      width: scWidth * 0.75,
                      child: Flexible(
                        child: Text(
                          product.Name,
                          softWrap: true,
                          maxLines: 2,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(product.Quantity),
                    )
                  ],
                ),
                const Spacer(),
                IconButton(
                    icon: const Icon(Icons.share),
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
                  "₹ ${product.Price.toInt()}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const Spacer(),
                addTile(scWidth, number),
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
                  const Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      "Description",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ),
                  ReadMoreText(
                    trimLength: 50,
                    trimLines: 7,
                    colorClickableText: Colors.pink,
                    trimMode: TrimMode.Line,
                    moreStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                    lessStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                    trimCollapsedText: '\nRead more >>',
                    trimExpandedText: '\nShow less <<',
                    product.Description,
                  ),
                ],
              ),
            )
          ]),
        )
      ],
    );
  }

  void incrementHandler(phonenumber) {
    if (counter == 5) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Quantity Exceeded'),
          content: const Text('Maximum Quantity limit is 5'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Ok'),
            ),
          ],
        ),
      );
    } else {
      setState(() {
        counter++;
      });

      final cartViewModel = ref.read(cartItemsProvider(phonenumber).notifier);
      cartViewModel.updateCartItem(
          phonenumber, counter.toString(), product.productId);
    }
  }

  void decrementHandler(phonenumber) {
    if ((counter - 1) == 0) {
      final cartViewModel = ref.read(cartItemsProvider(phonenumber).notifier);
      cartViewModel
          .removeCartItems(phonenumber, product.productId)
          .whenComplete(() {
        setState(() {
          counter--;
        });
      });
    } else {
      final cartViewModel = ref.read(cartItemsProvider(phonenumber).notifier);
      cartViewModel
          .updateCartItem(
              phonenumber, (counter - 1).toString(), product.productId)
          .whenComplete(() {
        setState(() {
          counter--;
        });
      });
    }
  }

  Widget addTile(scWidth, String number) {
    if (number != '') {
      final CartItemModel = ref.watch(cartItemsProvider(number));
      if (CartItemModel.isLoading) {
        return SpinKitThreeInOut(
          size: 38,
          color: Theme.of(context).primaryColor,
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
    }
    print('counter is:::::::::::::: $counter\n');
    return buildAddTile(scWidth, number);
  }

  Widget buildAddTile(scWidth, String number) {
    return counter != 0
        ? Container(
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(5)),
            width: scWidth * 0.25,
            height: scWidth * 0.25 * 0.4,
            child: Row(children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => decrementHandler(number),
                  child: Icon(
                    // Color(value),
                    color: Theme.of(context).primaryColor,
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
                  onTap: () => incrementHandler(number),
                  child: Icon(
                    color: Theme.of(context).primaryColor,
                    Icons.add,
                    size: scWidth * 0.25 * 0.3,
                  ),
                ),
              ),
            ]),
          )
        : Container(
            width: scWidth * 0.48 * 0.5,
            height: scWidth * 0.25 * 0.4,
            child: OutlinedButton(
                onPressed: () {
                  if (number == '') {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Login First'),
                        content: const Text('Login to Continue'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, '/loginScreen'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  } else {
                    setState(() {
                      counter++;
                    });
                    final cartViewModel =
                        ref.read(cartItemsProvider(number).notifier);
                    cartViewModel.addCartItems(number, product.productId);
                  }
                },
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

    var authInfo = ref.watch(authCheckProvider);

    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Expanded(
                child: Text(
                  product.Name,
                  style: const TextStyle(fontSize: 15),
                  softWrap: false,
                  // overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              child: authInfo == null
                  ? buildProduct(context, scWidth, '')
                  : buildProduct(context, scWidth, authInfo)),
        ),
        backgroundColor: Colors.white,
        bottomNavigationBar: Container(
          decoration:
              BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/cartScreen');
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor),
                  // textColor: Colors.white,
                  child: const Text('View Cart'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed('/buySubscriptionScreen', arguments: {
                      'product': product,
                      'function': 'buy',
                      'subsid': '',
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor),
                  // textColor: Colors.white,
                  child: const Text('Subscribe'),
                ),
              ],
            ),
          ),
        ));
  }
}
