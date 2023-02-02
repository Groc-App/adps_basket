// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scWidth = scSize.width;
    final scHeight = scSize.height;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/categoryScreen');
              },
              child: SizedBox(
                height: scHeight * 0.25,
                width: scWidth * 0.66,
                // color: Colors.black,
                child: const Card(color: Colors.lightGreen),
              ),
            ),
            SizedBox(
              height: scHeight * 0.25,
              width: scWidth * 0.33,
              child: const Card(color: Colors.lightBlue),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: scHeight * 0.25,
              width: scWidth * 0.33,
              child: const Card(color: Colors.lightBlue),
            ),
            SizedBox(
              height: scHeight * 0.25,
              width: scWidth * 0.33,
              child: const Card(color: Colors.lightBlue),
            ),
            SizedBox(
              height: scHeight * 0.25,
              width: scWidth * 0.33,
              child: const Card(color: Colors.lightBlue),
            ),
          ],
        )
      ],
    );
  }
}
