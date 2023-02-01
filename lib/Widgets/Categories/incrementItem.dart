// ignore: unused_import
import 'dart:developer';

import 'package:flutter/material.dart';

class IncrementItem extends StatefulWidget {
  const IncrementItem({super.key});

  @override
  State<IncrementItem> createState() => _incrementItemState();
}

// ignore: camel_case_types
class _incrementItemState extends State<IncrementItem> {
  // const incrementItem({super.key});
  var counter = 1;

  @override
  Widget build(BuildContext context) {
    final sc_size = MediaQuery.of(context).size;
    final sc_width = sc_size.width;
    final sc_height = sc_size.height;
    /* ------------------- To INcrement and Decrement Counter ------------------- */
    void incrementHandler() {
      setState(() {
        counter++;
      });
    }

    void decrementHandler() {
      setState(() {
        if (counter == 0) return;
        counter--;
      });
    }

    /* ------------------------------ //Making row ------------------------------ */
    return Container(
      width: sc_width * 0.40 * 0.30,
      height: sc_width * 0.48 * 0.15,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: decrementHandler,
              icon: Icon(Icons.remove),
              iconSize: sc_width * 0.35 * 0.15 * 0.7),
          Text('$counter'),
          IconButton(
              onPressed: incrementHandler,
              icon: Icon(Icons.add),
              iconSize: sc_width * 0.35 * 0.15 * 0.7),
        ],
      ),
    );
  }
}
