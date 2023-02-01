import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:your_basket/Widgets/Categories/incrementItem.dart';
import 'incrementItem.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({super.key});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  bool flag = true;
  void addHandler() {
    setState(() {
      flag = false;
    });
  }

  /* ---------------- To Show Add TO Cart Button And + - button --------------- */

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: SizedBox(
            // child: AddToCart(),
            height: 20,
            width: 64,
            child: Container(
              // alignment: Alignment.center,
              height: 20,
              // width: 10,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8)),
              child: flag == true
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent),
                      onPressed: () {
                        addHandler();
                      },
                      child: Text("ADD"))
                  : IncrementItem(),
            )));
  }
}
