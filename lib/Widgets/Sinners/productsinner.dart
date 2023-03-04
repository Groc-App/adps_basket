// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductSinner extends StatelessWidget {
  const ProductSinner({super.key});

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scWidth = scSize.width;

    return Shimmer.fromColors(
        baseColor: Color.fromARGB(255, 224, 224, 224),
        highlightColor: Color.fromRGBO(213, 199, 199, 1),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: scWidth * 0.6,
                  width: scWidth * 0.5,
                  child: Card(),
                ),
                Container(
                  height: scWidth * 0.6,
                  width: scWidth * 0.4,
                  child: Card(),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: scWidth * 0.6,
                  width: scWidth * 0.4,
                  child: Card(),
                ),
                Container(
                  height: scWidth * 0.6,
                  width: scWidth * 0.4,
                  child: Card(),
                ),
              ],
            ),
          ],
        ));
  }
}
