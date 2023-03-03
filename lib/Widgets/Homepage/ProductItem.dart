// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/models/product/products.dart';

import '../../providers/providers.dart';

class ProductItem extends ConsumerStatefulWidget {
  // const ProductItem({super.key});

  late Product product;

  ProductItem({required this.product});

  @override
  ConsumerState<ProductItem> createState() => _ProductItemState(
        product: product,
      );
}

class _ProductItemState extends ConsumerState<ProductItem> {
  // bool added = false;
  var counter = 0;

  @override
  void initState() {
    super.initState();
  }

  Product product;

  _ProductItemState({required this.product});

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

    // setState(() {
    //   counter--;
    // });
  }

  Widget addTile(scWidth) {
    final CartItemModel = ref.watch(cartItemsProvider);

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

    print('counter is:::::::::::::: $counter\n');

    return buildAddTile(scWidth);
  }

  Widget buildAddTile(scWidth) {
    return counter != 0
        ? Container(
            width: scWidth * 0.48 * 0.36,
            height: scWidth * 0.48 * 0.16,
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
                    onTap: () => decrementHandler(),
                  ),
                ),
                Text('$counter'),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    child: Icon(Icons.add, size: scWidth * 0.48 * 0.36 * 0.2),
                    onTap: () => incrementHandler(),
                  ),
                ),
              ],
            ),
          )
        : Container(
            width: scWidth * 0.48 * 0.38,
            child: FittedBox(
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
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scWidth = scSize.width;

    // var authInfo = ref.watch(authCheckProvider);
    // print(authInfo?.uid);

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
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                fit: FlexFit.loose,
                flex: 3,
                child: Image.network(
                  product.ImageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Column(
                    children: [
                      Text(
                        product.Name,
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        product.Quantity,
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        width: scWidth * 0.48 * 0.18,
                        child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              '\u{20B9}${product.Price}',
                              style: TextStyle(
                                  fontSize: 34, fontWeight: FontWeight.bold),
                            ))),
                    addTile(scWidth),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
