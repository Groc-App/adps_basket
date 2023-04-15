// ignore_for_file: file_names, must_be_immutable, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/Screens/cartScreen.dart';
import 'package:your_basket/models/product/productdetail.dart';
import 'package:your_basket/models/product/products.dart';

import '../../providers/providers.dart';

class CartItem extends ConsumerStatefulWidget {
  int quantity;
  ProductItem item;
  String userid;

  CartItem({
    super.key,
    required this.quantity,
    required this.item,
    required this.userid,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CartItemState createState() =>
      _CartItemState(quan: quantity, item: item, userid: userid);
}

class _CartItemState extends ConsumerState<CartItem> {
  ProductItem item;
  int quan;
  String userid;

  _CartItemState({
    required this.quan,
    required this.item,
    required this.userid,
  });

  void incrementHandler() {
    if (quan == 5) {
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
      int newquan = quan + 1;

      final cartViewModel = ref.read(cartItemsProvider(userid).notifier);
      cartViewModel.updateCartItem(userid, newquan.toString(), item.productId);

      setState(() {
        quan++;
      });
    }
  }

  void decrementHandler() {
    if (quan == 0) return;
    int newquan = quan - 1;

    if (newquan == 0) {
      final cartViewModel = ref.read(cartItemsProvider(userid).notifier);
      cartViewModel
          .removeCartItems(userid, item.productId)
          .whenComplete(() => Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (BuildContext context,
                      Animation<double> animation1,
                      Animation<double> animation2) {
                    return const CartScreen();
                  },
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                ),
              ));
    } else {
      final cartViewModel = ref.read(cartItemsProvider(userid).notifier);
      cartViewModel.updateCartItem(userid, newquan.toString(), item.productId);
    }

    setState(() {
      quan--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;
    final scWidth = scSize.width - 10 - 4 - 8;

    return GestureDetector(
      onTap: () {
        Product product = Product(
            productId: item.productId,
            Name: item.Name,
            Price: item.Price,
            ImageUrl: item.ImageUrl,
            Quantity: item.Quantity,
            Company: item.Company,
            Description: item.Description,
            MainCategory: item.MainCategory,
            Category: item.Category);
        Navigator.pushReplacementNamed(context, '/productItemPage',
            arguments: {'product': product});
      },
      child: Card(
        elevation: 5,
        child: Container(
            height: scHeight * 0.18,
            margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
            padding: const EdgeInsets.all(3),
            child: Row(
              children: [
                SizedBox(
                  width: scWidth * 0.2,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        fit: BoxFit.contain,
                        item.ImageUrl[0],
                      )),
                ),
                Container(
                  alignment: const Alignment(-1, -1),
                  padding: const EdgeInsets.only(left: 8, top: 3),
                  width: (scWidth * 0.55) - 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item.Name,
                        maxLines: 3,
                        overflow: TextOverflow.clip,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        item.Quantity,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w100),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Text(
                          '₹ ${item.Price}',
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(5)),
                  width: scWidth * 0.25,
                  height: scWidth * 0.25 * 0.4,
                  child: Row(children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => decrementHandler(),
                        child: Icon(
                          color: Theme.of(context).primaryColor,
                          Icons.remove,
                          size: scWidth * 0.25 * 0.3,
                        ),
                      ),
                    ),
                    SizedBox(
                        width: scWidth * 0.25 * 0.3,
                        child: Text(
                          '$quan',
                          textAlign: TextAlign.center,
                        )),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => incrementHandler(),
                        child: Icon(
                          color: Theme.of(context).primaryColor,
                          Icons.add,
                          size: scWidth * 0.25 * 0.3,
                        ),
                      ),
                    ),
                  ]),
                )
              ],
            )),
      ),
    );
  }
}
