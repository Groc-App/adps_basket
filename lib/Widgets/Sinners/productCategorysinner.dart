// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductCategorySinner extends StatelessWidget {
  const ProductCategorySinner({super.key});

  @override
  Widget build(BuildContext context) {
    // final scSize = MediaQuery.of(context).size;
    // final scWidth = scSize.width;

    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 224, 224, 224),
      highlightColor: const Color.fromRGBO(213, 199, 199, 1),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 50,
            width: 50,
            child: Card(),
          ),
          SizedBox(
            height: 50,
            width: 50,
            child: Card(),
          ),
          SizedBox(
            height: 50,
            width: 50,
            child: Card(),
          ),
          SizedBox(
            height: 50,
            width: 50,
            child: Card(),
          ),
        ],
      ),
    );
  }
}
