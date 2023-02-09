// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/models/cart/cartitem.dart';

import '../../providers/providers.dart';

final counterProvider = StateProvider<int>(
  // We return the default sort type, here name.
  (ref) => 0,
);

class CartItem extends ConsumerStatefulWidget {
  int quantity = 0;

  CartItem({required this.quantity});

  @override
  _CartItemState createState() => _CartItemState(quan: quantity);
}

class _CartItemState extends ConsumerState<CartItem> {
  int quan;

  _CartItemState({required this.quan});
  void incrementHandler() {
    setState(() {
      quan++;
    });
    ref.read(counterProvider.notifier).update((state) => state + 1);
    final ciupdate = ref
        .read(cartItemUpdateProvider({'id': '', 'quantity': counterProvider}));
  }

  void decrementHandler() {
    if (counterProvider == 1) {
      // delete vali api bna kr call marni h

      return;
    } else {
      quan--;
      final ciupdate = ref.read(
          cartItemUpdateProvider({'id': '', 'quantity': counterProvider}));
      ref.read(counterProvider.notifier).update((state) => state + 1);
    }
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
                    'data:image/jpeg;base64,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'),
              ),
            ),
            Container(
              alignment: const Alignment(-1, -1),
              padding: const EdgeInsets.only(left: 10, top: 5),
              width: scWidth * 0.65,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Banana',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  const Text(
                    '6 pieces',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w100),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: const Text(
                      '28\$',
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
              width: scWidth * 0.15,
              child: Row(children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => decrementHandler(),
                    child: Icon(
                      Icons.remove,
                      size: scWidth * 0.15 * 0.3,
                    ),
                  ),
                ),
                SizedBox(
                    width: scWidth * 0.15 * 0.3,
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
                      size: scWidth * 0.15 * 0.3,
                    ),
                  ),
                ),
              ]),
            )
          ],
        ));
  }
}
