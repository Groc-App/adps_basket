// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AddressSinner extends StatelessWidget {
  const AddressSinner({super.key});

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;
    final scWidth = scSize.width;

    return Shimmer.fromColors(
      baseColor: Color.fromARGB(255, 224, 224, 224),
      highlightColor: Color.fromRGBO(213, 199, 199, 1),
      child: Container(
        width: scWidth * 0.9,
        height: 45,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(4),
              decoration:
                  BoxDecoration(color: Colors.amber, shape: BoxShape.circle),
              width: scWidth * 0.08,
              height: scWidth * 0.08,
              child: Container(
                decoration: BoxDecoration(shape: BoxShape.circle),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              width: scWidth * 0.5,
              color: Colors.green[300],
            ),
            Spacer(),
            Container(
              width: 20,
              color: Colors.green[300],
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: 20,
              color: Colors.green[300],
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
