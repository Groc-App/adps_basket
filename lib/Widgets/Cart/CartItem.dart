// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/Screens/cartScreen.dart';
import 'package:your_basket/models/cart/cartitem.dart';
import 'package:your_basket/models/product/productdetail.dart';
import 'package:your_basket/models/product/products.dart';

import '../../providers/providers.dart';

class CartItem extends ConsumerStatefulWidget {
  int quantity;
  ProductItem item;
  String userid;

  CartItem({
    required this.quantity,
    required this.item,
    required this.userid,
  });

  @override
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
    int newquan = quan + 1;

    final cartViewModel = ref.read(cartItemsProvider.notifier);
    cartViewModel.updateCartItem(userid, newquan.toString(), item.productId);

    setState(() {
      quan++;
    });
  }

  void decrementHandler() {
    int newquan = quan - 1;

    if (newquan == 0) {
      print('0000000000000000000000000000000000000000000000000000000000000');
      print('inside cart item ${item.productId}');
      final cartViewModel = ref.read(cartItemsProvider.notifier);
      cartViewModel
          .removeCartItems(userid, item.productId)
          .whenComplete(() => Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (BuildContext context,
                      Animation<double> animation1,
                      Animation<double> animation2) {
                    return CartScreen();
                  },
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                ),
              ));
    } else {
      final cartViewModel = ref.read(cartItemsProvider.notifier);
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

    // print('\ncart itemmmmmmmmmmmmmm rebuild ho rhi hhhhhhhhhhhhhhhhhhhh\n${item.Name}');
    //
    // print('\ninside cart itemmmmmmmmmmmmmmmmmmmm\n');
    // print(item);

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
        Navigator.pushNamed(context, '/productItemPage',
            arguments: {'product': product});
      },
      child: Container(
          height: scHeight * 0.18,
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              boxShadow: const [BoxShadow(blurRadius: 2, spreadRadius: 0.5)],
              borderRadius: BorderRadius.circular(5),
              color: Colors.white),
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
                padding: const EdgeInsets.only(left: 10, top: 5),
                width: (scWidth * 0.55) - 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item.Name,
                      maxLines: 3,
                      overflow: TextOverflow.clip,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      item.Quantity,
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w100),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Text(
                        '₹ ' + item.Price.toString(),
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
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
                        '${quan}',
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
            ],
          )),
    );
  }
}
