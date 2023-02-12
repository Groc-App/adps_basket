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

    var authInfo = ref.watch(authCheckProvider);
    print(authInfo?.uid);

    void incrementHandler() {
      setState(() {
        counter++;
      });
      Map<String, String> mp = {
        "id": id,
        "quantity": quantity,
        "userid": authInfo?.phoneNumber ?? '',
      };
      ref.read(updatecartitem(mp));
    }

    void decrementHandler() {
      if (counter == 1) {
        setState(() {
          added = false;
        });
      } else {
        setState(() {
          counter--;
        });
      }
      Map<String, String> mp = {
        "id": id,
        "quantity": quantity,
        "userid": authInfo?.phoneNumber ?? '',
      };
      ref.read(updatecartitem(mp));
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
                              if (authInfo == null) {
                              } else {
                                setState(() {
                                  added = true;
                                  Map<String, String> mp = {
                                    "id": id,
                                    "quantity": quantity,
                                    "userid": authInfo.phoneNumber ?? '',
                                  };
                                  ref.read(updatecartitem(mp));
                                });
                              }
                            },
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
