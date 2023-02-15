// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/models/cart/cartitem.dart';
import 'package:your_basket/models/product/productdetail.dart';

import '../../providers/providers.dart';

final counterProvider = StateProvider<int>(
  // We return the default sort type, here name.
  (ref) => 0,
);

class CartItem extends ConsumerStatefulWidget {
  int quantity = 0;
  ProductItem item;
  String userid;

  CartItem({required this.quantity, required this.item, required this.userid});

  @override
  _CartItemState createState() =>
      _CartItemState(quan: quantity, item: item, userid: userid);
}

class _CartItemState extends ConsumerState<CartItem> {
  ProductItem item;
  int quan;
  String userid;

  _CartItemState(
      {required this.quan, required this.item, required this.userid});

  void incrementHandler() {
    setState(() {
      quan++;
    });
    // final ciupdate = ref.watch(updatecartitem({
    //   'id': item.productId,
    //   'quantity': quan.toString(),
    //   'userid': userid,
    // }));

    // Future.delayed(const Duration(milliseconds: 800), () {
    //   ref.watch(counterProvider.notifier).update((state) => quan);
    // });

    final cartViewModel = ref.read(cartItemsProvider.notifier);
    cartViewModel.updateCartItem(userid, quan, item.productId);
  }

  void decrementHandler() {
    setState(() {
      quan--;
    });
    // final ciupdate = ref.read(updatecartitem({
    //   'id': item.productId,
    //   'quantity': quan.toString(),
    //   'userid': userid,
    // }));
    // .whenData((value) =>
    //     ref.watch(counterProvider.notifier).update((state) => quan));

    // Future.delayed(const Duration(milliseconds: 800), () {
    //   ref.watch(counterProvider.notifier).update((state) => quan);
    // });

    final cartViewModel = ref.read(cartItemsProvider.notifier);
    cartViewModel.updateCartItem(userid, quan, item.productId);
  }

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;
    final scWidth = scSize.width - 10 - 4 - 8;

    return Container(
        height: scHeight * 0.18,
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            boxShadow: const [BoxShadow(blurRadius: 5, spreadRadius: 0.5)],
            borderRadius: BorderRadius.circular(5),
            color: Colors.white),
        child: Row(
          children: [
            SizedBox(
              width: scWidth * 0.2,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    fit: BoxFit.fill,
                    item.ImageUrl,
                  )),
            ),
            Container(
              alignment: const Alignment(-1, -1),
              padding: const EdgeInsets.only(left: 10, top: 5),
              width: scWidth * 0.55,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.Name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    item.Quantity,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w100),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Text(
                      item.Price.toString() + '\$',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: const Border(
                      top: BorderSide(width: 2),
                      bottom: BorderSide(width: 2),
                      left: BorderSide(width: 2),
                      right: BorderSide(width: 2)),
                  borderRadius: BorderRadius.circular(5)),
              width: scWidth * 0.25,
              height: scWidth * 0.25 * 0.4,
              child: Row(children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => decrementHandler(),
                    child: Icon(
                      Icons.remove,
                      size: scWidth * 0.25 * 0.3,
                    ),
                  ),
                ),
                SizedBox(
                    width: scWidth * 0.25 * 0.3,
                    child: Text(
                      '${quan}',
                      textAlign: TextAlign.center,
                    )),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => incrementHandler(),
                    child: Icon(
                      Icons.add,
                      size: scWidth * 0.25 * 0.3,
                    ),
                  ),
                ),
              ]),
            )
          ],
        ));
  }
}
