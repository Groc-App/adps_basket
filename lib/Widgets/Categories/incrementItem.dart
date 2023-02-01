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
        if (counter == 1) return;
        counter--;
      });
    }

    /* ------------------------------ //Making row ------------------------------ */
    return Container(
      // margin: EdgeInsets.only(bottom: sc_height * 0.1),
      margin: EdgeInsets.only(bottom: 2),
      width: sc_width * 0.28 * 0.35,
      height: sc_width * 0.28 * 0.15,

      color: Color.fromARGB(255, 130, 96, 177).withOpacity(0.3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: decrementHandler,
            child: Icon(Icons.remove, size: sc_width * 0.28 * 0.15 * 0.7),
          ),
          Text('$counter'),
          GestureDetector(
            onTap: incrementHandler,
            child: Icon(Icons.add, size: sc_width * 0.28 * 0.15 * 0.7),
          )
        ],
      ),
    );
  }
}
