// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CartItemSinner extends StatelessWidget {
  const CartItemSinner({super.key});

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;

    return Shimmer.fromColors(
        baseColor: const Color.fromARGB(255, 224, 224, 224),
        highlightColor: const Color.fromRGBO(213, 199, 199, 1),
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
