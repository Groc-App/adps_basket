// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';

final ProductItemcounterProvider = StateProvider<int>(
  // We return the default sort type, here name.
  (ref) => 0,
);

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
  bool added = false;
  var counter = 1;

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

    void incrementHandler() {
      setState(() {
        counter++;
      });
      Map<String, String> mp = {
        "id": id,
        "quantity": counter.toString(),
        "userid": '+917982733943',
        // "userid": authInfo?.phoneNumber ?? '',
      };
      // ref.read(updatecartitem(mp));

      // // to notify changes in cart screen

      // ref
      //     .read(ProductItemcounterProvider.notifier)
      //     .update((state) => state + 1);

      final cartViewModel = ref.read(cartItemsProvider.notifier);
      cartViewModel.updateCartItem('+917982733943', counter, id);
    }

    void decrementHandler() {
      if (counter == 1) {
        setState(() {
          counter--;
          added = false;
        });
        Map<String, String> mp = {
          "id": id,
          "quantity": '0',
          "userid": '+917982733943',
          // "userid": authInfo?.phoneNumber ?? '',
        };
        // ref.read(updatecartitem(mp));
      } else {
        setState(() {
          counter--;
        });
        Map<String, String> mp = {
          "id": id,
          "quantity": counter.toString(),
          "userid": '+917982733943',
          // "userid": authInfo?.phoneNumber ?? '',
        };
        // ref.read(updatecartitem(mp));
      }

      // to notify changes in cart screen

      // ref
      //     .read(ProductItemcounterProvider.notifier)
      //     .update((state) => state + 1);

      final cartViewModel = ref.read(cartItemsProvider.notifier);
      cartViewModel.updateCartItem('+917982733943', counter, id);
    }

    return Card(
      color: Colors.amber,
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
              added == true
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
                                added = true;
                                Map<String, String> mp = {
                                  "id": id,
                                  "quantity": counter.toString(),
                                  "userid": '+917982733943',
                                  // "userid": authInfo?.phoneNumber ?? '',
                                };
                                // ref.read(updatecartitem(mp));

                                // // to notify changes in cart screen

                                // ref
                                //     .watch(ProductItemcounterProvider.notifier)
                                //     .update((state) => state + 1);

                                final cartViewModel =
                                    ref.read(cartItemsProvider.notifier);
                                cartViewModel.updateCartItem(
                                    '+917982733943', counter, id);
                              });
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
