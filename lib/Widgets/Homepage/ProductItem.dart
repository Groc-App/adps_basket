// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:your_basket/models/product/products.dart';

import '../../providers/providers.dart';

String userNumber = '';

class ProductItem extends ConsumerStatefulWidget {
  // const ProductItem({super.key});

  late Product product;

  ProductItem({required this.product, super.key});

  @override
  ConsumerState<ProductItem> createState() => _ProductItemState(
        product: product,
      );
}

class _ProductItemState extends ConsumerState<ProductItem> {
  // bool added = false;
  var counter = 0;

  Future<void> getNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userNumberr = prefs.getString('username') ?? '';
    setState(() {
      userNumber = userNumberr;
    });
    print("userNumber $userNumber");
  }

  @override
  void initState() {
    super.initState();
    getNumber();
  }

  Product product;

  _ProductItemState({required this.product});

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
        // return CircularProgressIndicator();
        return SpinKitThreeInOut(
          size: 25,
          color: Theme.of(context).primaryColor,
        );
      }

      // if (CartItemModel.cartModel == null) {
      //   return const LinearProgressIndicator();
      // }

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
    return buildAddTile(scWidth, number);
  }

  Widget buildAddTile(scWidth, String number) {
    return counter != 0
        ? Container(
            width: scWidth * 0.48 * 0.36,
            height: scWidth * 0.48 * 0.20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    child:
                        Icon(Icons.remove, size: scWidth * 0.48 * 0.36 * 0.2),
                    onTap: () => decrementHandler(number),
                  ),
                ),
                Text('$counter'),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    child: Icon(Icons.add, size: scWidth * 0.48 * 0.36 * 0.2),
                    onTap: () => incrementHandler(number),
                  ),
                ),
              ],
            ),
          )
        : SizedBox(
            width: scWidth * 0.48 * 0.38,
            child: FittedBox(
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
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scWidth = scSize.width;

    product = widget.product;

    // var authInfo = ref.watch(authCheckProvider);
    // print(authInfo);

    return GestureDetector(
      onTap: () {
        // print("IIIIIIIID $prod");
        Navigator.of(context).pushNamed('/productItemPage', arguments: {
          'product': product,
          'counter': counter,
        });
      },
      child: Card(
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        // color: Colors.white,
        elevation: 5,

        child: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  flex: 3,
                  child: CachedNetworkImage(
                    imageUrl: product.ImageUrl[0],
                    fit: BoxFit.cover,
                    // progressIndicatorBuilder:
                    // (context, url, downloadProgress) =>
                    //     CircularProgressIndicator(
                    //         value: downloadProgress.progress),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(top: 7, left: 5, right: 5),
                    // fit: BoxFit.scaleDown,
                    // decoration: BoxDecoration(border: Border.all()),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.Name,
                          softWrap: true,
                          maxLines: 2,
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            product.Quantity,
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          width: scWidth * 0.48 * 0.28,
                          child: Text(
                            '\u{20B9}${product.Price.toInt()}',
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          )),
                      addTile(scWidth, userNumber),
                      // addTile(scWidth, '+917982733943'),
                    ],
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
