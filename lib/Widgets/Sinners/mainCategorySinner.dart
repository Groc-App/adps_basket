// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MainCategorySinner extends StatelessWidget {
  const MainCategorySinner({super.key});

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;
    final scWidth = scSize.width;

    return Shimmer.fromColors(
        baseColor: const Color.fromARGB(255, 224, 224, 224),
        highlightColor: const Color.fromRGBO(213, 199, 199, 1),
        // child: Container(),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: scHeight * 0.25,
                  width: scWidth * 0.63,
                  child: const Card(),
                ),
                SizedBox(
                  height: scHeight * 0.25,
                  width: scWidth * 0.31,
                  child: const Card(),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  height: scHeight * 0.25,
                  width: scWidth * 0.31,
                  child: const Card(),
                ),
                SizedBox(
                  height: scHeight * 0.25,
                  width: scWidth * 0.31,
                  child: const Card(),
                ),
                SizedBox(
                  height: scHeight * 0.25,
                  width: scWidth * 0.31,
                  child: const Card(),
                ),
              ],
            )
          ],
        ));
  }
}
