import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class QuoteSinner extends StatelessWidget {
  const QuoteSinner({super.key});

  @override
  Widget build(BuildContext context) {
    // final scSize = MediaQuery.of(context).size;
    // final scHeight = scSize.height;
    // final scWidth = scSize.width;

    return Shimmer.fromColors(
        baseColor: const Color.fromARGB(255, 224, 224, 224),
        highlightColor: const Color.fromRGBO(213, 199, 199, 1),
        // child: Container(),
        child: const SizedBox(
          width: double.infinity,
          height: 50,
        ));
  }
}
