// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';

class ProductItem extends ConsumerStatefulWidget {
  // const ProductItem({super.key});

  late String id;
  late String imageUrl;
  late String name;
  late String desc;
  late double price;
  late String quantity;

  ProductItem(
      {required this.id,
      required this.imageUrl,
      required this.name,
      required this.desc,
      required this.price,
      required this.quantity});

  @override
  ConsumerState<ProductItem> createState() => _ProductItemState(
      id: id,
      imageUrl: imageUrl,
      name: name,
      desc: desc,
      price: price,
      quantity: quantity);
}

class _ProductItemState extends ConsumerState<ProductItem> {
  // bool added = false;
  var counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    // final cartState = ref.read(cartItemsProvider);
    // final data = cartState.cartModel!.products.toList();
    // print('dataitem\n');
    // print("\nThis is data inside init state $data");
    // if (data != null) {
    //   for (var i = 0; i < data.length; i++) {
    //     if (data[i].Item.productId == id) {
    //       counter = data[i].ItemCount;
    //       break;
    //     }
    //   }
    // }
    super.initState();
  }

  String id;
  String imageUrl;
  String name;
  String desc;
  double price;
  String quantity;

  _ProductItemState({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.desc,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scWidth = scSize.width;

    // var authInfo = ref.watch(authCheckProvider);
    // print(authInfo?.uid);

    // final cartState = ref.read(cartItemsProvider);
    // final data = cartState.cartModel!.products;
    // print('dataitem\n');
    // for (var i = 0; i < data.length; i++) {
    //   if (data[i].Item.productId == id) {
    //     counter = data[i].ItemCount;
    //     break;
    //   }
    // }

    void incrementHandler() {
      setState(() {
        counter++;
      });

      final cartViewModel = ref.read(cartItemsProvider.notifier);
      cartViewModel.updateCartItem('+917982733943', counter.toString(), id);
    }

    void decrementHandler() {
      setState(() {
        counter--;
      });

      if (counter == 0) {
        final cartViewModel = ref.read(cartItemsProvider.notifier);
        cartViewModel.removeCartItems('+917982733943', id);
      } else {
        final cartViewModel = ref.read(cartItemsProvider.notifier);
        cartViewModel.updateCartItem('+917982733943', counter.toString(), id);
      }
    }

    return Card(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Flexible(
          fit: FlexFit.loose,
          flex: 3,
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Column(
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  quantity,
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
                        '\u{20B9}${price}',
                        style: TextStyle(
                            fontSize: 34, fontWeight: FontWeight.bold),
                      ))),
              counter != 0
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
                              child: Icon(Icons.remove,
                                  size: scWidth * 0.48 * 0.36 * 0.2),
                              onTap: () => decrementHandler(),
                            ),
                          ),
                          Text('$counter'),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              child: Icon(Icons.add,
                                  size: scWidth * 0.48 * 0.36 * 0.2),
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
                              final cartViewModel =
                                  ref.read(cartItemsProvider.notifier);
                              cartViewModel.addCartItems('+917982733943', id);
                            }
                            // }
                            ,
                            child: const Text('ADD')),
                      ),
                    ),
            ],
          ),
        )
      ]),
    );
  }
}
