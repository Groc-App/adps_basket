import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    final sc_size = MediaQuery.of(context).size;
    final sc_width = sc_size.width;
    final sc_height = sc_size.height;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: sc_height * 0.25,
              width: sc_width * 0.66,
              // color: Colors.black,
              child: Card(color: Colors.lightGreen),
            ),
            Container(
              height: sc_height * 0.25,
              width: sc_width * 0.33,
              child: Card(color: Colors.lightBlue),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: sc_height * 0.25,
              width: sc_width * 0.33,
              child: Card(color: Colors.lightBlue),
            ),
            Container(
              height: sc_height * 0.25,
              width: sc_width * 0.33,
              child: Card(color: Colors.lightBlue),
            ),
            Container(
              height: sc_height * 0.25,
              width: sc_width * 0.33,
              child: Card(color: Colors.lightBlue),
            ),
          ],
        )
      ],
    );
  }
}
