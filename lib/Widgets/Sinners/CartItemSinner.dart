import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CartItemSinner extends StatelessWidget {
  const CartItemSinner({super.key});

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;
    final scWidth = scSize.width;

    return Shimmer.fromColors(
        baseColor: Color.fromARGB(255, 224, 224, 224),
        highlightColor: Color.fromRGBO(213, 199, 199, 1),
        child: Column(
          children: [
            Container(
              height: scHeight * 0.18,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(blurRadius: 2, spreadRadius: 0.5)
              ], borderRadius: BorderRadius.circular(5), color: Colors.white),
            ),
            Container(
              height: scHeight * 0.18,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(blurRadius: 2, spreadRadius: 0.5)
              ], borderRadius: BorderRadius.circular(5), color: Colors.white),
            ),
            Container(
              height: scHeight * 0.18,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(blurRadius: 2, spreadRadius: 0.5)
              ], borderRadius: BorderRadius.circular(5), color: Colors.white),
            ),
            Container(
              height: scHeight * 0.18,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(blurRadius: 2, spreadRadius: 0.5)
              ], borderRadius: BorderRadius.circular(5), color: Colors.white),
            ),
          ],
        ));
  }
}
